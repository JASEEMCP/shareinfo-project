import 'package:shareinfo/application/home/suggested_list_cubit/suggested_list_cubit.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/home/screens/_suggested_screen_end_drawer.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_job_card_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenJobSuggestion extends StatefulWidget {
  const ScreenJobSuggestion({
    super.key,
  });

  @override
  State<ScreenJobSuggestion> createState() => _ScreenJobSuggestionState();
}

class _ScreenJobSuggestionState extends State<ScreenJobSuggestion> {
  final ValueNotifier<int> selectedItemNotifier = ValueNotifier(0);
  final GlobalKey<ScaffoldState> _scKey = GlobalKey<ScaffoldState>();
  final Debouncer _debouncerSearch =
      Debouncer(const Duration(milliseconds: 750));
  final Debouncer _debouncerSave = Debouncer(const Duration(milliseconds: 250));

  void _refreshScreen(BuildContext context) async {
    selectedItemNotifier.value = 0;
    await context.read<SuggestedListCubit>().refreshJobList();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<SuggestedListCubit>().refreshJobList();
      },
    );
    return Scaffold(
      key: _scKey,
      resizeToAvoidBottomInset: false,
      endDrawer:
          buildEndDrawerSuggestedScreen(context, selectedItemNotifier, _scKey),
      appBar: buildCustomAppBar(
        context,
        title: 'Job Suggestion',
        enableSuffixIcon: false,
        action: [
          Padding(
            padding: EdgeInsets.only(right: inset.sm),
            child: IconButton(
              onPressed: () {
                _scKey.currentState!.openEndDrawer();
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
              disableSuffix: true,
              hintText: 'Search something here..!',
              onPressed: () {},
              onChanged: (searchKey) {
                _debouncerSearch.call(() {
                  context
                      .read<SuggestedListCubit>()
                      .getJobListWithType(searchKey, JobQueryType.jobTitle);
                });
              },
            ),
          ),
          Gap(inset.sm),
          BlocBuilder<SuggestedListCubit, SuggestedListState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const Expanded(child: JobListLoadingView()),
                empty: () => NotFound(
                  onRefresh: () => _refreshScreen(context),
                ),
                error: (e) => NetWorkError(
                  onRefresh: () => _refreshScreen(context),
                ),
                success: (model) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => _refreshScreen(context),
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
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: inset.sm),
                              child: CustomJobCardWidget(
                                companyLogo: model[index].companyLogo ?? '',
                                onSaved: () {
                                  _debouncerSave.call(() {
                                    context.read<SuggestedListCubit>().saveJob(
                                        model[index].jobId ?? '', index);
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
                                  context.push(ScreenPath.homeJobDetail(
                                      JobType.suggestedJobs,
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
}
