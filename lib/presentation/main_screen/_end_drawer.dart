import 'package:shareinfo/application/job/job_list_cubit/job_list_cubit.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/jobs/job_screen.dart';
import 'package:shareinfo/presentation/widget/end_drawer1_widget.dart';

ValueListenableBuilder<dynamic> buildEndDrawer(
    BuildContext context, ValueNotifier selectedItemNotifier) {
  final inset = $style.insets;

  return ValueListenableBuilder(
    valueListenable: selectedItemNotifier,
    builder: (context, buttonId, Widget? child) {
      return CustomDrawerWidget(
        items: [
          Padding(
            padding: EdgeInsets.only(right: inset.xs),
            child: Text(
              'Application Type',
              textScaler: const TextScaler.linear(1),
              textAlign: TextAlign.center,
              style: $style.text.textBold10.copyWith(
                color: context.theme.statusGreenAccentDark,
              ),
            ),
          ),
          Gap(inset.xs),
          CustomStatusButton(
            textColor: context.theme.statusBlueAccentDark,
            backgroundColor: context.theme.statusBlue,
            statusName: 'Show All',
            selectedItem: buttonId,
            buttonId: 0,
            onPressed: (index) {
              selectedItemNotifier.value = index;
              scKey.currentState?.closeEndDrawer();
              context.read<JobListCubit>().refreshJobList();
            },
          ),
          Gap(inset.md),
          CustomStatusButton(
            textColor: context.theme.statusYellowAccentDark,
            backgroundColor: context.theme.statusYellow,
            statusName: 'Full Time',
            selectedItem: buttonId,
            buttonId: 1,
            onPressed: (index) {
              selectedItemNotifier.value = index;
              scKey.currentState?.closeEndDrawer();
              context
                  .read<JobListCubit>()
                  .getJobListWithType('Full time', JobQueryType.workingMode);
            },
          ),
          Gap(inset.md),
          CustomStatusButton(
            textColor: context.theme.statusRedAccentDark,
            backgroundColor: context.theme.statusRed,
            statusName: 'Part Time',
            selectedItem: buttonId,
            buttonId: 2,
            onPressed: (index) {
              selectedItemNotifier.value = index;
              scKey.currentState?.closeEndDrawer();
              context
                  .read<JobListCubit>()
                  .getJobListWithType('Part time', JobQueryType.workingMode);
            },
          ),
          Gap(inset.md),
          CustomStatusButton(
            textColor: context.theme.statusGreenAccentDark,
            backgroundColor: context.theme.statusGreen,
            statusName: 'Internship',
            selectedItem: buttonId,
            buttonId: 3,
            onPressed: (index) {
              selectedItemNotifier.value = index;
              scKey.currentState?.closeEndDrawer();
              context
                  .read<JobListCubit>()
                  .getJobListWithType('Internship', JobQueryType.workingMode);
            },
          ),
          Gap(inset.md),
          CustomStatusButton(
            textColor: context.theme.statusPurpleAccentDark,
            backgroundColor: context.theme.statusPurple,
            statusName: 'Freelance',
            selectedItem: buttonId,
            buttonId: 4,
            onPressed: (index) {
              selectedItemNotifier.value = index;
              scKey.currentState?.closeEndDrawer();
              context
                  .read<JobListCubit>()
                  .getJobListWithType('Freelance', JobQueryType.workingMode);
            },
          ),
          Gap(inset.md),
          CustomStatusButton(
            textColor: context.theme.statusYellowAccentDark,
            backgroundColor: context.theme.statusYellow,
            statusName: 'My Application',
            selectedItem: buttonId,
            buttonId: 5,
            onPressed: (index) async {
              selectedItemNotifier.value = index;
              await Future.delayed(const Duration(milliseconds: 250));
              context.mounted ? context.go(ScreenPath.application) : null;
              scKey.currentState?.closeEndDrawer();
              selectedItemNotifier.value = -1;
            },
          ),
          Gap(inset.md),
          Padding(
            padding: EdgeInsets.only(right: inset.xs),
            child: Text(
              'Application Category',
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold10.copyWith(
                color: context.theme.statusRedAccentDark,
              ),
            ),
          ),
          Gap(inset.xs),
          CustomStatusButton(
            textColor: context.theme.statusBlueAccentDark,
            backgroundColor: context.theme.statusBlue,
            statusName: 'Open Recruitment',
            selectedItem: buttonId,
            buttonId: 6,
            onPressed: (index) {
              selectedItemNotifier.value = index;
              scKey.currentState?.closeEndDrawer();
              context
                  .read<JobListCubit>()
                  .retrieveJobByApplicationType(JobCategory.openRecruitment);
            },
          ),
          Gap(inset.md),
          Visibility(
            visible: auth.authInfo.value.isStudent ?? false,
            child: CustomStatusButton(
              textColor: context.theme.statusGreenAccentDark,
              backgroundColor: context.theme.statusGreen,
              statusName: 'Campus Recruitment',
              selectedItem: buttonId,
              buttonId: 7,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                scKey.currentState?.closeEndDrawer();
                context.read<JobListCubit>().retrieveJobByApplicationType(
                    JobCategory.campusRecruitment);
              },
            ),
          ),
        ],
      );
    },
  );
}
