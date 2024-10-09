import 'package:shareinfo/application/job/applied_job_cubit/applied_job_cubit.dart';
import 'package:shareinfo/presentation/widget/status_tile_widget.dart.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/views/error_views/deactivate_account_empty.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenDeactivateAccount extends StatelessWidget {
  const ScreenDeactivateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<AppliedJobCubit>().getAppliedJobInDeactivateAccount();
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: BlocBuilder<AppliedJobCubit, AppliedJobState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const ApplicationListTileView(),
            error: (e) => NetWorkError(
              onRefresh: () {
                context
                    .read<AppliedJobCubit>()
                    .getAppliedJobInDeactivateAccount();
              },
            ),
            success: (model) {
              return ListView(
                children: [
                  model.isEmpty
                      ? const DeactivateAccountMessage()
                      : Column(
                          children: <Widget>[
                            Text(
                              'Deactivate Account ?',
                              textAlign: TextAlign.center,
                              style: $style.text.textBold26.copyWith(
                                  color: context.theme.imiotDarkPurple),
                            ),
                            const Gap(10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10 * context.w),
                              child: Text(
                                'You will lose all completed profiles and also all your job applications',
                                textAlign: TextAlign.center,
                                style: $style.text.textSBold12.copyWith(
                                  color: context.theme.imiotDarkPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: model.length,
                    itemBuilder: ((context, index) {
                      return StatusTileWidget(
                        logo: model[index].companyLogo,
                        title: model[index].jobTitle,
                        companyName: model[index].companyName,
                        status: model[index].applicationStatus,
                        onPressed: () {
                          context.go(ScreenPath.deactivateApplication(
                              model[index].jobId ?? ''));
                        },
                      );
                    }),
                  )
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(
          builder: (context) {
            final currentState = context.watch<AppliedJobCubit>().state;
            return !currentState.isLoading &&
                    !currentState.isError &&
                    !currentState.isEmpty
                ? CustomElevatedButton(
                    buttonName: "Continue",
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      context.push(ScreenPath.deactivate());
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
