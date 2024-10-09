import 'package:shareinfo/application/job/campus_job_cubit/campus_job_cubit.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/presentation/home/screens/chat_screen.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_job_card_widget.dart';
import 'package:shareinfo/presentation/widget/end_drawer1_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenCampusPlacement extends StatefulWidget {
  const ScreenCampusPlacement({
    super.key,
  });

  @override
  State<ScreenCampusPlacement> createState() => _ScreenCampusPlacementState();
}

class _ScreenCampusPlacementState extends State<ScreenCampusPlacement> {
  final ValueNotifier selectedItemNotifier = ValueNotifier<int>(0);

  final GlobalKey<ScaffoldState> _endDrawerKey = GlobalKey<ScaffoldState>();
  final Debouncer _debouncerSave = Debouncer(const Duration(milliseconds: 250));
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));
  _refreshScreen(BuildContext context) async {
    selectedItemNotifier.value = 0;
    await context.read<CampusJobCubit>().refreshJobList();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<CampusJobCubit>().refreshJobList();
      },
    );
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: false,
      key: _endDrawerKey,
      endDrawer: _buildEndDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size(0, kToolbarHeight),
        child: Builder(builder: (context) {
          final currentState = context.watch<CampusJobCubit>().state;
          final accessDenied = context.watch<CampusJobCubit>().state.maybeWhen(
                orElse: () => true,
                error: (e) {
                  if (e.accessDenied) {
                    return false;
                  }
                  return true;
                },
              );
          return buildCustomAppBar(
            context,
            title: 'Campus Placements',
            enableSuffixIcon: false,
            background: !accessDenied ? const Color(0xffECEDFF) : null,
            action: [
              Visibility(
                visible: accessDenied && !currentState.isLoading,
                child: Padding(
                  padding: EdgeInsets.only(right: inset.sm),
                  child: IconButton(
                    onPressed: () {
                      _endDrawerKey.currentState!.openEndDrawer();
                    },
                    icon: const Icon(Icons.filter_alt),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      body: BlocBuilder<CampusJobCubit, CampusJobState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const JobListLoadingView(),
            empty: () => NotFound(
              padding: const EdgeInsets.only(top: 100),
              onRefresh: () => _refreshScreen(context),
            ),
            error: (e) {
              if (e.accessDenied) {
                return ChatScreen(
                  onSubmit: () {
                    context.pop();
                  },
                  enableBottomText: true,
                );
              }
              return NetWorkError(
                padding: const EdgeInsets.only(top: 100),
                onRefresh: () => _refreshScreen(context),
              );
            },
            success: (model) {
              return RefreshIndicator(
                edgeOffset: 50,
                onRefresh: () async => _refreshScreen(context),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: inset.sm,
                        left: inset.sm,
                      ),
                      child: CustomSearchField(
                        disableSuffix: true,
                        hintText: 'Search something here..!',
                        onPressed: () {},
                        onChanged: (searchKey) {
                          _debouncer.call(
                            () {
                              context.read<CampusJobCubit>().getJobListWithType(
                                  searchKey, JobQueryType.jobTitle);
                            },
                          );
                        },
                      ),
                    ),
                    Gap(inset.sm),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: inset.sm,
                        left: inset.sm,
                        right: inset.sm,
                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: inset.sm),
                            child: CustomJobCardWidget(
                              companyLogo: model[index].companyLogo ?? '',
                              onSaved: () {
                                _debouncerSave.call(() {
                                  context
                                      .read<CampusJobCubit>()
                                      .saveJob(model[index].jobId!, index);
                                });
                              },
                              title: model[index].jobTitle,
                              isCampus: model[index].isCampus,
                              subtitle: model[index].companyName,
                              location: model[index].location!.isEmpty
                                  ? 'N/A'
                                  : model[index].location![0],
                              description: model[index].salaryType == 'Onwards'
                                  ? '₹ ${getSalaryToLpa(model[index].minimumSalary)} LPA - onwards'
                                  : model[index].salaryType == 'Range'
                                      ? '${getSalaryToLpa(model[index].minimumSalary)} LPA to ${getSalaryToLpa(model[index].maximumSalary)} LPA'
                                      : '${getSalaryToLpa(model[index].minimumSalary)} LPA',
                              workingMode: model[index].workingMode,
                              isSaved: model[index].isSaved,
                              onPressed: () {
                                context.push(ScreenPath.jobDetail(
                                    JobType.campusJobs,
                                    model[index].jobId ?? ''));
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
              textColor: context.theme.statusBlueAccentDark,
              backgroundColor: context.theme.statusBlue,
              statusName: 'Show All',
              selectedItem: buttonId,
              buttonId: 0,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context.read<CampusJobCubit>().refreshJobList();
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
                    .read<CampusJobCubit>()
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
                    .read<CampusJobCubit>()
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
                    .read<CampusJobCubit>()
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
                    .read<CampusJobCubit>()
                    .getJobListWithType('Freelance', JobQueryType.workingMode);
              },
            ),
          ],
        );
      },
    );
  }
}
