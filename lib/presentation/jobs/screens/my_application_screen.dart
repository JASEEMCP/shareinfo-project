import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/application_job_tile_widget.dart';
import 'package:shareinfo/presentation/widget/end_drawer1_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenMyApplications extends StatefulWidget {
  const ScreenMyApplications({super.key});

  @override
  State<ScreenMyApplications> createState() => _ScreenMyApplicationsState();
}

class _ScreenMyApplicationsState extends State<ScreenMyApplications> {
  final ValueNotifier selectedItemNotifier = ValueNotifier<int>(0);

  final GlobalKey<ScaffoldState> _endDrawerKey = GlobalKey<ScaffoldState>();

  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));

  void _refreshScreen(BuildContext context) async {
    selectedItemNotifier.value = 0;
    await context.read<AppliedJobCubit>().refreshAppliedJobList();
  }

  @override
  void dispose() {
    super.dispose();
    getIt<AppliedJobCubit>().clearData();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<AppliedJobCubit>().getAppliedJobList();
      },
    );
    return Scaffold(
      key: _endDrawerKey,
      resizeToAvoidBottomInset: false,
      appBar: buildCustomAppBar(
        context,
        title: "My Application",
        enableSuffixIcon: false,
      ),
      endDrawer: _buildEndDrawer(selectedItemNotifier),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: inset.sm,
              left: inset.sm,
            ),
            child: CustomSearchField(
              hintText: 'Search something here..!',
              onPressed: () {
                _endDrawerKey.currentState!.openEndDrawer();
              },
              onChanged: (searchKey) {
                _debouncer.call(() {
                  context
                      .read<AppliedJobCubit>()
                      .searchAppliedJob(searchKey.trim());
                });
              },
            ),
          ),
          Gap(inset.sm),
          BlocBuilder<AppliedJobCubit, AppliedJobState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const Expanded(child: ApplicationListTileView()),
                empty: () => NotFound(onRefresh: () => _refreshScreen(context)),
                error: (e) =>
                    NetWorkError(onRefresh: () => _refreshScreen(context)),
                success: (model) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => _refreshScreen(context),
                      child: ListView.builder(
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          return ApplicationJobTilWidget(
                            companyLogo: model[index].companyLogo ?? '',
                            applicationCount: model[index].applicationCount,
                            title: model[index].jobTitle,
                            subTitle: model[index].companyName,
                            location: model[index].location!.isEmpty
                                ? 'N/A'
                                : model[index].location![0],
                            isCampus: model[index].isCampus,
                            workingMode: model[index].workingMode,
                            lpaRange: model[index].salaryType == 'Onwards'
                                ? '₹ ${getSalaryToLpa(model[index].minimumSalary)} LPA - onwards'
                                : model[index].salaryType == 'Range'
                                    ? '${getSalaryToLpa(model[index].minimumSalary)} LPA to ${getSalaryToLpa(model[index].maximumSalary)} LPA'
                                    : '${getSalaryToLpa(model[index].minimumSalary)} LPA',
                            applicationStatus: model[index].applicationStatus,
                            onPressed: () {
                              context.go(ScreenPath.applicationStatus(
                                  model[index].jobId ?? ''));
                            },
                            desc5: "",
                            isFinalItem: index == model.length,
                          );
                        },
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

  ValueListenableBuilder<dynamic> _buildEndDrawer(ValueNotifier value) {
    final inset = $style.insets;
    return ValueListenableBuilder(
      valueListenable: value,
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
                context.read<AppliedJobCubit>().refreshAppliedJobList();
              },
            ),
            Gap(inset.md),
            CustomStatusButton(
              textColor: context.theme.statusBlueAccentDark,
              backgroundColor: context.theme.statusBlue,
              statusName: 'Sent',
              selectedItem: buttonId,
              buttonId: 1,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<AppliedJobCubit>()
                    .getAppliedJobListWithType('Sent');
              },
            ),
            Gap(inset.md),
            CustomStatusButton(
              textColor: context.theme.statusYellowAccentDark,
              backgroundColor: context.theme.statusYellow,
              statusName: 'Pending',
              selectedItem: buttonId,
              buttonId: 2,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<AppliedJobCubit>()
                    .getAppliedJobListWithType('Pending');
              },
            ),
            Gap(inset.md),
            CustomStatusButton(
              textColor: context.theme.statusRedAccentDark,
              backgroundColor: context.theme.statusRed,
              statusName: 'Rejected',
              selectedItem: buttonId,
              buttonId: 3,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<AppliedJobCubit>()
                    .getAppliedJobListWithType('Rejected');
              },
            ),
            Gap(inset.md),
            CustomStatusButton(
              textColor: context.theme.statusGreenAccentDark,
              backgroundColor: context.theme.statusGreen,
              statusName: 'Approved',
              selectedItem: buttonId,
              buttonId: 4,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<AppliedJobCubit>()
                    .getAppliedJobListWithType('Approved');
              },
            ),
            Gap(inset.offset),
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
              textColor: context.theme.statusPurpleAccentDark,
              backgroundColor: context.theme.statusPurple,
              statusName: 'General',
              selectedItem: buttonId,
              buttonId: 5,
              onPressed: (index) {
                selectedItemNotifier.value = index;
                _endDrawerKey.currentState?.closeEndDrawer();
                context
                    .read<AppliedJobCubit>()
                    .retrieveAppliedJobByApplicationType(
                        JobCategory.openRecruitment);
              },
            ),
            Gap(inset.md),
            Visibility(
              visible: auth.authInfo.value.isStudent ?? false,
              child: CustomStatusButton(
                textColor: context.theme.statusGreenAccentDark,
                backgroundColor: context.theme.statusGreen,
                statusName: 'Intuitional',
                selectedItem: buttonId,
                buttonId: 6,
                onPressed: (index) {
                  selectedItemNotifier.value = index;
                  _endDrawerKey.currentState?.closeEndDrawer();
                  context
                      .read<AppliedJobCubit>()
                      .retrieveAppliedJobByApplicationType(
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
