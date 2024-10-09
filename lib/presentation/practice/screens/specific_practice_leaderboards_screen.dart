import 'package:shareinfo/application/practice/specific_practice_leaderboards_cubit/specific_practice_leaderboards_list_cubit.dart';

import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_circular_icon_button.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';
import 'package:shareinfo/presentation/widget/leader_board_card.dart';

class ScreenSpecificPracticeLeaderboards extends StatelessWidget {
  const ScreenSpecificPracticeLeaderboards(
      {super.key, required this.practiceId});

  final String practiceId;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<SpecificPracticeLeaderboardsListCubit>()
            .getSpecificPracticeLeaderboards(practiceId);
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: CircularIconButton(
          icon: Icons.arrow_back,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<SpecificPracticeLeaderboardsListCubit,
            SpecificPracticeLeaderboardsListState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e) => Scaffold(
                body: NetWorkError(
                  onRefresh: () => context
                      .read<SpecificPracticeLeaderboardsListCubit>()
                      .getSpecificPracticeLeaderboards(practiceId),
                ),
              ),
              success: (m) => Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: inset.sm,
                        right: inset.sm,
                        top: inset.md,
                        bottom: inset.md,
                      ),
                      child: Column(
                        children: [
                          LeaderBoardCardWidget(
                            noDayLeft: m.noDayLeft.toString(),
                            leaderboardsType: 'Practice',
                            top3candidate: null,
                            onPressed: () {
                              context.go(ScreenPath.faqLeaderboards());
                            },
                          ),
                          Gap(inset.sm),
                          if (m.loggedInCandidate != null)
                            LeaderboardsTileWidgetType2(
                              name: m.loggedInCandidate?.candidateName,
                              submittedDate: m.loggedInCandidate?.timeDuration,
                              perks: m.loggedInCandidate?.perks.toString(),
                              isLoggedUser: true,
                            ),
                          Gap(inset.sm),
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Divider(
                                  color: context.theme.shareinfoGrey,
                                ),
                              ),
                              Gap(inset.xxxs),
                              Expanded(
                                child: Divider(
                                  color: context.theme.shareinfoGrey,
                                ),
                              ),
                              Gap(inset.xxxs),
                              Expanded(
                                flex: 6,
                                child: Divider(
                                  color: context.theme.shareinfoGrey,
                                ),
                              ),
                            ],
                          ),
                          Gap(inset.sm),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Live Competitions',
                              style: $style.text.textBold14.copyWith(
                                color: context.theme.imiotDarkPurple,
                              ),
                            ),
                          ),
                          Gap(inset.sm),
                          ListView.separated(
                            separatorBuilder: (context, index) => Gap(inset.sm),
                            shrinkWrap: true,
                            itemCount: m.top20Candidates?.length ?? 0,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return LeaderboardsTileWidgetType2(
                                name: m.top20Candidates?[index].candidateName,
                                submittedDate:
                                    m.top20Candidates?[index].timeDuration,
                                perks:
                                    m.top20Candidates?[index].perks.toString(),
                                isLoggedUser: false,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
