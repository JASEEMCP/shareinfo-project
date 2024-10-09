import 'package:shareinfo/application/practice/leaderboards_list_cubit/leaderboards_list_cubit.dart';
import 'package:shareinfo/domain/practice/models/leaderboards_model/logged_in_candidate.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_circular_icon_button.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';
import 'package:shareinfo/presentation/widget/leader_board_card.dart';

class LeaderboardsWidget extends StatelessWidget {
  const LeaderboardsWidget(
      {super.key, this.enableBackButton, required this.leaderboardsType});

  final String leaderboardsType;

  final bool? enableBackButton;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<LeaderboardsListCubit>().getLeaderboards(leaderboardsType);
      },
    );

    return SafeArea(
      child: BlocBuilder<LeaderboardsListCubit, LeaderboardsListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e) => Scaffold(
              body: NetWorkError(
                onRefresh: () => context
                    .read<LeaderboardsListCubit>()
                    .getLeaderboards(leaderboardsType),
              ),
            ),
            success: (m) => Scaffold(
              body: Stack(
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
                            leaderboardsType: leaderboardsType == 'weakly'
                                ? 'Weekly'
                                : leaderboardsType.toTitleCase(),
                            top3candidate: m.top3Candidate,
                            onPressed: () {
                              context.go(ScreenPath.faqLeaderboards());
                            },
                          ),
                          Gap(inset.sm),
                          if (m.loggedInCandidate != null)
                            LeaderboardsTileWidget(
                              candidateData: m.loggedInCandidate,
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
                              'Live Competitions (${m.noOfCandidate ?? 0})',
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
                              return LeaderboardsTileWidget(
                                candidateData: m.top20Candidates?[index] ??
                                    LoggedInCandidate(),
                                isLoggedUser: false,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  if (enableBackButton ?? false)
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.only(left: inset.xs),
                        child: CircularIconButton(
                          icon: Icons.arrow_back,
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
