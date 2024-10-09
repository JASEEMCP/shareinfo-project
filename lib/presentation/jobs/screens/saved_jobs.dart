import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_job_card_widget.dart';
import 'package:shareinfo/presentation/widget/end_drawer1_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/no_saved_jobs.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenJobsSaved extends StatelessWidget {
  ScreenJobsSaved({
    super.key,
  });

  final ValueNotifier selectedItemNotifier = ValueNotifier<int>(-1);
  final Debouncer _debouncerSave = Debouncer(const Duration(milliseconds: 200));
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));
  final GlobalKey<ScaffoldState> _endDrawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<SavedJobsCubit>().refreshJobList();
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _endDrawerKey,
      endDrawer: _buildEndDrawer(),
      appBar: buildCustomAppBar(
        context,
        title: "Saved Jobs",
        enableSuffixIcon: false,
        action: [
          Padding(
            padding: EdgeInsets.only(right: inset.sm),
            child: IconButton(
              onPressed: () {
                _endDrawerKey.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.filter_alt),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: inset.sm,
              left: inset.sm,
            ),
            child: CustomSearchField(
              hintText: "Search",
              disableSuffix: true,
              onPressed: () {},
              onChanged: (searchKey) {
                _debouncer.call(
                  () {
                    context
                        .read<SavedJobsCubit>()
                        .getJobListWithType(searchKey, JobQueryType.jobTitle);
                  },
                );
              },
            ),
          ),
          Gap(inset.sm),
          BlocBuilder<SavedJobsCubit, SavedJobsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const Expanded(child: JobListLoadingView()),
                empty: () => NoSavedJob(
                  onRefresh: () {
                    context.go(ScreenPath.jobs);
                  },
                ),
                error: (e) => NetWorkError(
                  onRefresh: () async {
                    await context.read<SavedJobsCubit>().refreshJobList();
                  },
                ),
                success: (model) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await context.read<SavedJobsCubit>().refreshJobList();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: inset.sm,
                          left: inset.sm,
                          right: inset.sm,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                ResponsiveWidget.isSmallScreen(context)
                                    ? 1
                                    : (context.w * 100) ~/ 300,
                            crossAxisSpacing: 10,
                            mainAxisExtent:
                                ResponsiveWidget.isSmallScreen(context)
                                    ? 195
                                    : 205,
                          ),
                          shrinkWrap: true,
                          itemCount: model.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: inset.sm),
                              child: CustomJobCardWidget(
                                companyLogo: model[index].companyLogo ?? '',
                                onSaved: () {
                                  _debouncerSave.call(() {
                                    context
                                        .read<SavedJobsCubit>()
                                        .saveJob(model[index].jobId!, index);
                                  });
                                },
                                title: model[index].jobTitle,
                                isCampus: model[index].isCampus,
                                subtitle: model[index].companyName,
                                location: model[index].location!.isEmpty
                                    ? 'N/A'
                                    : model[index].location![0],
                                description: model[index].salaryType ==
                                        'Onwards'
                                    ? '₹ ${getSalaryToLpa(model[index].minimumSalary)} LPA - onwards'
                                    : model[index].salaryType == 'Range'
                                        ? '${getSalaryToLpa(model[index].minimumSalary)} LPA to ${getSalaryToLpa(model[index].maximumSalary)} LPA'
                                        : '${getSalaryToLpa(model[index].minimumSalary)} LPA',
                                workingMode: model[index].workingMode,
                                isSaved: model[index].isSaved,
                                onPressed: () {
                                  context.push(ScreenPath.jobDetail(
                                      JobType.savedJobs,
                                      model[index].jobId ?? ''));
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  ValueListenableBuilder<dynamic> _buildEndDrawer() {
    final inset = $style.insets;
    return ValueListenableBuilder(
      valueListenable: selectedItemNotifier,
      builder: (context, buttonId, Widget? child) {
        return CustomDrawerWidget(
          items: [
            Padding(
              padding: EdgeInsets.only(right: inset.xs),
              child: Text(
                'Application Status',
                textScaler: const TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: $style.text.textBold10.copyWith(
                  color: context.theme.statusGreenAccentDark,
                ),
              ),
            ),
            Gap(inset.xs),
            CustomStatusButton(
              textColor: context.theme.statusPurpleAccentDark,
              backgroundColor: context.theme.statusPurple,
              statusName: 'Show All',
              selectedItem: buttonId,
              buttonId: 0,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context.read<SavedJobsCubit>().refreshJobList();
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
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<SavedJobsCubit>()
                    .getJobListWithType('Full Time', JobQueryType.workingMode);
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
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<SavedJobsCubit>()
                    .getJobListWithType('Part Time', JobQueryType.workingMode);
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
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<SavedJobsCubit>()
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
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<SavedJobsCubit>()
                    .getJobListWithType('Freelance', JobQueryType.workingMode);
              },
            ),
            Gap(inset.md),
            Padding(
              padding: EdgeInsets.only(right: inset.xs),
              child: Text(
                'Application Category',
                textScaler: const TextScaler.linear(1),
                textAlign: TextAlign.center,
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
              buttonId: 5,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<SavedJobsCubit>()
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
                buttonId: 6,
                onPressed: (index) {
                  selectedItemNotifier.value = index;
                  _endDrawerKey.currentState?.closeEndDrawer();
                  context.read<SavedJobsCubit>().retrieveJobByApplicationType(
                      JobCategory.campusRecruitment);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
