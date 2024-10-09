import 'package:shareinfo/application/job/apply_job_cubit/apply_job_cubit.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/profile/model/profile_model/profile_model.dart';
import 'package:shareinfo/presentation/jobs/screens/applied_success_dialog_box.dart';
import 'package:shareinfo/presentation/jobs/screens/apply_job_error_dialog.dart';
import 'package:shareinfo/presentation/profile/categorized_profile_items.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/widget/views/profile_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenJobApplyWithProfile extends StatefulWidget {
  const ScreenJobApplyWithProfile({super.key});

  @override
  State<ScreenJobApplyWithProfile> createState() =>
      _ScreenJobApplyWithProfileState();
}

class _ScreenJobApplyWithProfileState extends State<ScreenJobApplyWithProfile> {
  late ScrollController _scrollController;
  late double _savedScrollPosition;
  ProfileModel model = ProfileModel();

  void _scrollToPosition(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
    _savedScrollPosition = 0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ///calling profile event profile screen appearing
        context.read<ProfileBloc>().add(const ProfileEvent.refreshProfile());
      },
    );
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: "Apply Job",
        enableSuffixIcon: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _savedScrollPosition = 0;
          context.read<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SafeArea(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  error: (e) => NetWorkError(
                    onRefresh: () {
                      _savedScrollPosition = 0;
                      context
                          .read<ProfileBloc>()
                          .add(const ProfileEvent.refreshProfile());
                    },
                  ),
                  loadingProfile: () => const ProfileLoadingView(),
                  profileSuccess: (profileData) {
                    model = profileData;
                    if (_savedScrollPosition != 0) {
                      _scrollToPosition(_savedScrollPosition);
                    }

                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: $style.insets.sm),
                      child: Column(
                        children: [
                          CategorizedProfileWidget(
                            validate: true,
                            profileModel: profileData,
                            onTap: () {
                              _savedScrollPosition =
                                  _scrollController.position.pixels;
                            },
                          ),
                          Gap($style.insets.lg)
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: BlocConsumer<ApplyJobCubit, ApplyJobState>(
          listener: (context, state) async {
            if (state.applySuccess) {
              context.pop();
              buildAppliedSuccessDialogBox(context);
            }
            if (state.isError) {
              buildAppliedErrorDialogBox(context);
            }
          },
          builder: (context, stateX) {
            return Builder(
              builder: (context) {
                final currentState = context.watch<ProfileBloc>().state;

                return !currentState.isLoading && !currentState.isError
                    ? CustomElevatedButton(
                        buttonName: "Submit",
                        isLoading: stateX.isApplying,
                        width: ElevatedButtonWidth.large,
                        onPressed: () {
                          if (model.profileCompleted! < 100) {
                            ScaffoldMessenger.of(context).showSnackBar(showSnackBar(
                                'To apply for a new job, you must complete required field are above mentioned'));
                          } else {
                            context
                                .read<ApplyJobCubit>()
                                .applyJob(applyJobModel);
                          }
                        },
                      )
                    : const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
