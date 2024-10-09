import 'package:shareinfo/application/job/applied_job_detail_cubit/applied_job_detail_cubit.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/presentation/main_screen/main_screen.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/job_overview_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenApplicationStatus extends StatelessWidget {
  const ScreenApplicationStatus({
    super.key,
    required this.jobId,
  });
  final String jobId;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;

    String? applicationStatus;
    String? recruiterMail;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<AppliedJobDetailCubit>().getAppliedJobDetail(jobId);
      },
    );
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: "My Applications",
        enableSuffixIcon: false,
      ),
      body: BlocBuilder<AppliedJobDetailCubit, AppliedJobDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const CustomCircularProgressIndicatorC(),
            error: (e) => NetWorkError(
              onRefresh: () {
                context
                    .read<AppliedJobDetailCubit>()
                    .getAppliedJobDetail(jobId);
              },
            ),
            success: (model) {
              applicationStatus = model.applicationStatus;
              recruiterMail = model.recruiterMail;

              final statusColorSet =
                  getStatusColorSet(applicationStatus ?? 'Sent');
              return Column(
                children: [
                  ///Job card detail view
                  JobOverViewWidget(
                    companyLogo: model.companyLogo,
                    instituteName: model.instituteName,
                    jobTitle: model.jobTitle,
                    companyName: model.companyName,
                    location:
                        model.location!.isEmpty ? 'N/A' : model.location![0],
                    maxSalary: model.maximumSalary,
                    minSalary: model.minimumSalary,
                    isCampus: model.isCampus,
                    workingMode: model.workingMode,
                    enableExpireDate: false,
                    salaryType: model.salaryType,
                  ),
                  Center(
                    child: Text(
                      "Your Application Status",
                      textAlign: TextAlign.center,
                      style: $style.text.textSBold12.copyWith(
                        color: context.theme.imiotDarkPurple,
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: inset.md, vertical: inset.xs),
                    padding: EdgeInsets.all(inset.sm),
                    decoration: BoxDecoration(
                        color: statusColorSet.background,
                        borderRadius: BorderRadius.circular(inset.sm)),
                    child: Text(
                      "Application ${applicationStatus ?? 'N/A'}",
                      textAlign: TextAlign.center,
                      style: $style.text.textSBold12.copyWith(
                        color: statusColorSet.textColor,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<AppliedJobDetailCubit, AppliedJobDetailState>(
        builder: (context, state) {
          final canLaunch = state.maybeWhen(
            orElse: () => false,
            success: (m) => (applicationStatus == 'Approved' ||
                applicationStatus == 'Shortlisted'),
          );
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Elevated button
              Padding(
                padding: EdgeInsets.only(
                  bottom: $style.insets.md,
                ),
                child: CustomElevatedButton(
                  buttonName: (canLaunch)
                      ? 'Connect With Recruiter..!'
                      : "Discover More Jobs..!",
                  width: ElevatedButtonWidth.custom,
                  onPressed: () {
                    if (canLaunch) {
                      return launchEmail(recruiterMail ?? '');
                    }
                    tabChangeNotifier.value = 1;
                    context.go(ScreenPath.jobs);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
