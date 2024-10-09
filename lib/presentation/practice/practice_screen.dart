import 'package:shareinfo/application/practice/practice_list_cubit/practice_list_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/leader_board_card.dart';
import 'package:shareinfo/presentation/widget/practice_card_widget.dart';
import 'package:shareinfo/presentation/widget/views/profile_loading_view.dart';

class ScreenPractice extends StatelessWidget {
  const ScreenPractice({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<PracticeListCubit>().getPracticeList();
      },
    );
    return Scaffold(
      // AppBar
      appBar: _buildAppBar(context),
      // Body
      body: BlocBuilder<PracticeListCubit, PracticeListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            error: (_) => NetWorkError(
              onRefresh: () => _refreshScreen(context),
            ),
            loading: () => const ProfileLoadingView(),
            success: (m) => RefreshIndicator(
              onRefresh: () => _refreshScreen(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(inset.sm),
                  child: Column(
                    children: [
                      LeaderBoardCardWidget(
                        leaderboardsType: 'Global',
                        onPressed: () {
                          context.go(ScreenPath.leaderboards());
                        },
                      ),
                      Gap(inset.sm),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Start Your Practice Now !',
                          style: $style.text.textBold14.copyWith(
                            color: context.theme.imiotDarkPurple,
                          ),
                        ),
                      ),
                      Gap(inset.sm),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: m.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              ResponsiveWidget.isSmallScreen(context)
                                  ? 1
                                  : (context.w * 100) ~/ 300,
                          crossAxisSpacing: inset.xs,
                          mainAxisExtent: 195,
                          mainAxisSpacing: inset.sm,
                        ),
                        itemBuilder: (context, index) {
                          return PracticeCardWidget(
                            title: m[index].practiceTask,
                            description: m[index].description,
                            perks: m[index].perks.toString(),
                            category: m[index].category,
                            onPressed: () {
                              context.go(ScreenPath.practiceDetail(
                                  m[index].id.toString()));
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final inset = $style.insets;
    return AppBar(
      centerTitle: false,
      titleSpacing: inset.sm,
      //Search Field
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Challenges',
            textScaler: const TextScaler.linear(1),
            style: $style.text.textBold10.copyWith(
              color: context.theme.shareinfoMidBlue,
            ),
          ),
          Text(
            'ShareInfo',
            textScaler: const TextScaler.linear(1),
            style: $style.text.textBold14.copyWith(
              color: context.theme.shareinfoOrange,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.go(ScreenPath.myChallenges());
          },
          icon: Icon(
            Icons.view_carousel_rounded,
            color: context.theme.shareinfoBlue,
          ),
        )
      ],
    );
  }

  _refreshScreen(BuildContext context) {
    context.read<PracticeListCubit>().refreshPracticeList();
  }
}
