import 'package:shareinfo/application/happening/happening_list_cubit/happening_list_cubit.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/profile/widget/event_list_card_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';
import 'package:shareinfo/presentation/widget/views/error_views/search_not_found.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenEventSearch extends StatefulWidget {
  const ScreenEventSearch({
    super.key,
  });

  @override
  State<ScreenEventSearch> createState() => _ScreenEventSearchState();
}

class _ScreenEventSearchState extends State<ScreenEventSearch> {
  final GlobalKey<ScaffoldState> _scKey = GlobalKey<ScaffoldState>();

  final ValueNotifier<int> selectedItemNotifier = ValueNotifier(-1);
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));
  final _searchController = generateTextController();

  @override
  void dispose() {
    super.dispose();
    selectedItemNotifier.dispose();

    getIt<HappeningListCubit>().clearData();
  }

  @override
  void initState() {
    super.initState();
    context.read<HappeningListCubit>().initializeSearch();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;

    return Scaffold(
      key: _scKey,
      resizeToAvoidBottomInset: false,
      appBar: buildCustomAppBar(
        context,
        title: 'Search Happenings',
        enableSuffixIcon: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: inset.sm,
              left: inset.sm,
            ),
            child: Hero(
              tag: 'event_search',
              child: Material(
                child: CustomSearchField(
                  controller: _searchController,
                  autoFocus: true,
                  disableSuffix: true,
                  hintText: 'Search by using Topics..!',
                  onChanged: (searchKey) {
                    _debouncer.call(
                      () {
                        context
                            .read<HappeningListCubit>()
                            .searchEvent(searchKey.trim());
                      },
                    );
                  },
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Gap(inset.sm),
          BlocBuilder<HappeningListCubit, HappeningListState>(
            builder: (context, state) {
              return state.maybeWhen(
                initial: () => const SearchNotFound(
                  content: 'Search Here',
                  enableSearch: false,
                ),
                orElse: () => const SizedBox.shrink(),
                searching: () => const Expanded(child: EventListLoading()),
                notFound: () => const SearchNotFound(content: 'Not Found'),
                searchFail: (e) => NetWorkError(
                  onRefresh: () {
                    _searchController.clear();
                    context.read<HappeningListCubit>().searchEvent('');
                  },
                ),
                found: (model) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: inset.lg,
                        left: inset.sm,
                        right: inset.sm,
                      ),
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: inset.sm),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              ResponsiveWidget.isSmallScreen(context)
                                  ? 1
                                  : (context.w * 100) ~/ 300,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent:
                              ResponsiveWidget.isSmallScreen(context)
                                  ? 310
                                  : 310,
                        ),
                        itemCount: model.length,
                        itemBuilder: (ctx, index) {
                          return EventListCardWidget(
                            model: model,
                            index: index,
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
