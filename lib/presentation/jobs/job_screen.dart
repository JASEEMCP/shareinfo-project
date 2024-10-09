import 'package:shareinfo/application/job/job_list_cubit/job_list_cubit.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/widget/custom_job_card_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

///Declaring globally  key [scKey] for access endDrawer outside the file
final GlobalKey<ScaffoldState> scKey = GlobalKey<ScaffoldState>();
//To accessing buttons job end drawer
final ValueNotifier jobTypeNotifier = ValueNotifier<int>(0);

class ScreenJob extends StatefulWidget {
  const ScreenJob({
    super.key,
  });

  @override
  State<ScreenJob> createState() => _ScreenJobState();
}

class _ScreenJobState extends State<ScreenJob> {
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));
  final Debouncer _debouncerBtn = Debouncer(const Duration(milliseconds: 100));

  void _refreshScreen(BuildContext context) async {
    jobTypeNotifier.value = 0;
    await context.read<JobListCubit>().refreshJobList();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<JobListCubit>().retrieveJobList();
      },
    );
    return Scaffold(
      //App bar
      appBar: AppBar(
        actions: const [SizedBox.shrink()],

        titleSpacing: 0,
        //Search Field
        title: Padding(
          padding: EdgeInsets.only(
            right: inset.sm,
            left: inset.sm,
          ),
          child: Row(
            children: [
              Image.asset(
                ImagePaths.shareInfoLogo,
                height: 30,
              ),
              Gap(inset.sm),
              Expanded(
                child: CustomSearchField(
                  hintText: 'Search something here..!',
                  onPressed: () {
                    scKey.currentState!.openEndDrawer();
                  },
                  onChanged: (searchKey) {
                    _debouncer.call(() {
                      context
                          .read<JobListCubit>()
                          .getJobListWithType(searchKey, JobQueryType.jobTitle);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<JobListCubit, JobListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const JobListLoadingView(),
            empty: () => Center(
              child: NotFound(
                padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                onRefresh: () => _refreshScreen(context),
              ),
            ),
            error: (e) => NetWorkError(
              padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
              onRefresh: () => _refreshScreen(context),
            ),
            success: (model) {
              return RefreshIndicator(
                onRefresh: () async => _refreshScreen(context),
                child: ListView(
                  children: [
                    //header
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: inset.xs),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: inset.sm),
                            width: 50 * context.w,
                            child: Text(
                              '${model.length} Openings',
                              style: $style.text.textBold16.copyWith(
                                  color: context.theme.imiotDarkPurple,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Row(
                            children: [
                              Visibility(
                                visible: auth.authInfo.value.isStudent ?? false,
                                child: IconButton(
                                  onPressed: () {
                                    context.go(
                                        ScreenPath.jobType(JobType.campusJobs));
                                  },
                                  icon:
                                      const Icon(Icons.location_city_outlined),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.go(
                                      ScreenPath.jobType(JobType.savedJobs));
                                },
                                icon: const Icon(Icons.bookmark_added),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //Job list
                    Padding(
                      padding: EdgeInsets.only(
                          left: inset.sm, right: inset.sm, bottom: inset.sm),
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
                        itemCount: model.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: inset.sm),
                            child: CustomJobCardWidget(
                              companyLogo: model[index].companyLogo ?? '',
                              onSaved: () {
                                //Save job
                                _debouncerBtn.call(() {
                                  context.read<JobListCubit>().saveJob(
                                        model[index].jobId ?? '',
                                        index,
                                      );
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
                                context.go(ScreenPath.jobDetail(
                                    JobType.jobs, model[index].jobId ?? ''));
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
}
