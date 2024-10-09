import 'package:shareinfo/application/auth/institute_list_cubit/institute_list_cubit.dart';
import 'package:shareinfo/application/auth/profile_submission_cubit/profile_submission_cubit.dart';
import 'package:shareinfo/domain/auth/model/institute_list_model/institute_list_model/institute_list_model.dart';
import 'package:shareinfo/domain/auth/model/pre_profile_model/pre_profile_model.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

PreProfileModel preProfileModel = PreProfileModel();

class ScreenInstitutionSelection extends StatefulWidget {
  const ScreenInstitutionSelection({
    super.key,
  });

  @override
  State<ScreenInstitutionSelection> createState() =>
      _ScreenInstitutionSelectionState();
}

class _ScreenInstitutionSelectionState
    extends State<ScreenInstitutionSelection> {
  final ValueNotifier<InstituteListModel> selectedItemNotifier =
      ValueNotifier<InstituteListModel>(
          InstituteListModel(id: null, fullName: 'none'));

  final debouncer = Debouncer(const Duration(milliseconds: 500));
  final searchController = generateTextController();
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InstituteListCubit>().getInstituteList();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildCustomAppBar(
        context,
        title: 'Select Institute',
        enableSuffixIcon: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            _buildTextField(context),
            Gap(inset.xs),
            BlocBuilder<InstituteListCubit, InstituteListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  error: (e) => NetWorkError(
                    onRefresh: () {
                      context.read<InstituteListCubit>().getInstituteList();
                    },
                  ),
                  fetchingInstituteList: () =>
                      const CustomCircularProgressIndicator(),
                  //Success state
                  fetchingSuccess: (instituteList) => _buildRadioTile(
                    context,
                    item: instituteList,
                  ),
                  //Not found institute
                  notFound: () => NotFound(
                    onRefresh: () {
                      searchController.clear();
                      context.read<InstituteListCubit>().getInstituteList();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: ValueListenableBuilder(
          valueListenable: selectedItemNotifier,
          builder: (context, instituteId, _) {
            final currentState = context.watch<InstituteListCubit>().state;
            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    buttonName: "Continue",
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (instituteId.fullName == 'none') {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          showSnackBar('Please select your institute'),
                        );
                      }
                      //adding value into pre profile model
                      preProfileModel.currentInstitute = instituteId.id;

                      // Redirect screen if user is select Other option
                      if (instituteId.fullName == 'Other') {
                        preProfileModel.currentStatus = 'Fresher';
                        return context
                            .read<ProfileSubmissionCubit>()
                            .submitProfile(
                              preProfileModel,
                              isStudent: false,
                            );
                      }

                      context.go(
                        ScreenPath.studentVerification(),
                        extra: instituteId,
                      );
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Expanded _buildRadioTile(BuildContext context,
      {required List<InstituteListModel> item}) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: item.length,
        itemBuilder: (BuildContext context, int index) {
          return ValueListenableBuilder(
            valueListenable: selectedItemNotifier,
            builder: (context, instituteList, _) {
              return RadioListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: $style.insets.xs,
                ),
                dense: true,
                fillColor:
                    WidgetStatePropertyAll(context.theme.imiotDarkPurple),
                value: item[index],
                groupValue: instituteList,
                title: Text(
                  '${item[index].fullName}',
                  style: $style.text.textBold16.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
                onChanged: (value) {
                  selectedItemNotifier.value =
                      value ?? InstituteListModel(id: null, fullName: 'none');
                },
              );
            },
          );
        },
      ),
    );
  }

  Padding _buildTextField(
    BuildContext context,
  ) {
    final inset = $style.insets;
    return Padding(
      padding: EdgeInsets.only(
        left: inset.sm,
        right: inset.sm,
      ),
      child: TextField(
        style: $style.text.textBold14.copyWith(
          color: context.theme.imiotDarkPurple,
        ),
        onChanged: (value) {
          debouncer.call(() {
            context
                .read<InstituteListCubit>()
                .searchInstituteList(value.trim());
          });
        },
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          isDense: true,
          fillColor: const Color.fromARGB(255, 230, 226, 226),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(inset.sm),
            borderSide: BorderSide.none,
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(inset.sm),
          ),
          hintText: 'Search',
          prefixIconColor: context.theme.shareinfoGrey,
          hintStyle: $style.text.textBold14.copyWith(
            overflow: TextOverflow.ellipsis,
            color: context.theme.shareinfoGrey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    selectedItemNotifier.dispose();
    super.dispose();
  }
}
