import 'package:shareinfo/application/practice/enrolled_practice_list_cubit/enrolled_practice_list_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';
import 'package:shareinfo/presentation/widget/practice_card_widget.dart';
import 'package:shareinfo/presentation/widget/search_field_custom.dart';

class ScreenMyChallenges extends StatelessWidget {
  const ScreenMyChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<EnrolledPracticeListCubit>().getEnrolledPracticeList();
      },
    );
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: 'My Challenges',
        enableSuffixIcon: false,
      ),
      body: BlocBuilder<EnrolledPracticeListCubit, EnrolledPracticeListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e) => NetWorkError(
              onRefresh: () => context
                  .read<EnrolledPracticeListCubit>()
                  .refreshEnrolledPracticeList(),
            ),
            success: (m) => ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: inset.sm),
                  child: CustomSearchField(
                    hintText: 'Search',
                    disableSuffix: true,
                    onPressed: () {},
                  ),
                ),
                Gap(inset.sm),
                GridView.builder(
                  padding: EdgeInsets.all(inset.sm),
                  shrinkWrap: true,
                  itemCount: m.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                        ? 1
                        : (context.w * 100) ~/ 300,
                    crossAxisSpacing: inset.xs,
                    mainAxisExtent: 180,
                    mainAxisSpacing: inset.sm,
                  ),
                  itemBuilder: (context, index) {
                    return PracticeCardWidgetType2(
                      title: m[index].practiceTask,
                      description: m[index].description,
                      items: [
                        m[index].isOngoing ?? false
                            ? SmoothBorderChip(
                                text: 'On-going',
                                bgColor: context.theme.statusBlue,
                                textColor: context.theme.statusBlueAccentDark,
                                borderColor: context.theme.statusBlue,
                              )
                            : SmoothBorderChip(
                                text: 'Expired',
                                bgColor: context.theme.statusRed,
                                textColor: context.theme.statusRedAccentDark,
                                borderColor: context.theme.statusRed,
                              ),
                        m[index].isSubmit ?? false
                            ? SmoothBorderChip(
                                text: 'Submitted',
                                bgColor: context.theme.statusGreen,
                                textColor: context.theme.statusGreenAccentDark,
                                borderColor: context.theme.statusGreen,
                              )
                            : SmoothBorderChip(
                                text: 'Not Submitted',
                                bgColor: context.theme.statusRed,
                                textColor: context.theme.statusRedAccentDark,
                                borderColor: context.theme.statusRed,
                              ),
                        if (m[index].isSubmissionPending ?? false)
                          SmoothBorderChip(
                            text: 'Pending for Submission',
                            bgColor: context.theme.statusPurple,
                            textColor: context.theme.statusPurpleAccentDark,
                            borderColor: context.theme.statusPurple,
                          ),
                        if (m[index].isReviewPending ?? false)
                          SmoothBorderChip(
                            text: 'Pending for Review',
                            bgColor: context.theme.statusYellow,
                            textColor: context.theme.statusYellowAccentDark,
                            borderColor: context.theme.statusYellow,
                          ),
                        SmoothBorderChip(
                          text: '${m[index].noDaysLeft} Days Left',
                          bgColor: context.theme.shareinfoWhite,
                          textColor: context.theme.shareinfoOrange,
                          borderColor: context.theme.shareinfoGreyLite,
                        ),
                      ],
                      onPressed: () {
                        context.go(
                          ScreenPath.challengeDetail(
                            m[index].practiceId.toString(),
                            m[index].practiceTask.toString(),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
