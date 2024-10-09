import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/home/screens/_search_end_drawer.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_job_card_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/search_not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenHomeSearch extends StatefulWidget {
  const ScreenHomeSearch({
    super.key,
  });

  @override
  State<ScreenHomeSearch> createState() => _ScreenHomeSearchState();
}

class _ScreenHomeSearchState extends State<ScreenHomeSearch> {
  final GlobalKey<ScaffoldState> _scKey = GlobalKey<ScaffoldState>();

  final ValueNotifier<int> selectedItemNotifier = ValueNotifier(-1);
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));
  final Debouncer _debouncerSave = Debouncer(const Duration(milliseconds: 250));
  final _searchController = generateTextController();

  @override
  void dispose() {
    super.dispose();
    selectedItemNotifier.dispose();

    getIt<HomeSearchCubit>().clearData();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;

    return Scaffold(
      key: _scKey,
      resizeToAvoidBottomInset: false,
      endDrawer: buildSearchEndDrawer(context, selectedItemNotifier, _scKey),
      appBar: buildCustomAppBar(
        context,
        title: 'Search Job',
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
            child: Hero(
              tag: 'txt_field',
              child: Material(
                child: CustomSearchField(
                  controller: _searchController,
                  autoFocus: true,
                  disableSuffix: true,
                  hintText: 'Search something here..!',
                  onChanged: (searchKey) {
                    if (searchKey.isEmpty) {
                      selectedItemNotifier.value = -1;
                    }
                    _debouncer.call(() {
                      context
                          .read<HomeSearchCubit>()
                          .searchJob(searchKey.trim());
                    });
                  },
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Gap(inset.sm),
          BlocBuilder<HomeSearchCubit, HomeSearchState>(
            builder: (context, state) {
              return state.maybeWhen(
                initial: () => const SearchNotFound(
                  content: 'Search Here',
                  enableSearch: false,
                ),
                orElse: () => const SizedBox.shrink(),
                loading: () => const Expanded(child: JobListLoadingView()),
                empty: () => const SearchNotFound(content: 'Not Found'),
                error: (e) => NetWorkError(
                  onRefresh: () {
                    _searchController.clear();
                    context.read<HomeSearchCubit>().searchJob('');
                  },
                ),
                success: (model) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: inset.sm, left: inset.sm, right: inset.sm),
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
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: inset.sm),
                            child: CustomJobCardWidget(
                              companyLogo: model[index].companyLogo ?? '',
                              onSaved: () {
                                _debouncerSave.call(() {
                                  context.read<HomeSearchCubit>().saveJob(
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
                                context.push(ScreenPath.homeJobDetail(
                                    JobType.search, model[index].jobId ?? ''));
                              },
                            ),
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
}
