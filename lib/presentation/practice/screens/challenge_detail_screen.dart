import 'package:flutter/services.dart';
import 'package:shareinfo/application/practice/enrolled_process_list_cubit/enrolled_process_list_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/expandable_card_widget.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';
import 'package:shareinfo/presentation/widget/practice_card_widget.dart';

class ChallengeDetailScreen extends StatefulWidget {
  const ChallengeDetailScreen(
      {super.key, required this.id, required this.practiceName});
  final String id;

  final String practiceName;

  @override
  State<ChallengeDetailScreen> createState() => _ChallengeDetailScreenState();
}

class _ChallengeDetailScreenState extends State<ChallengeDetailScreen> {
  // Create a ScrollController to manage scrolling
  final ScrollController _scrollController = ScrollController();
  int activeIndex = 5; // Active index (e.g., 13 out of 15)
  int totalItems = 10;
  double itemWidth = 35.0; // Width of each item in pixels
  Set<int> triggeredIndices = {}; // Track triggered indices

  @override
  void initState() {
    super.initState();

    // Scroll to the active item when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToActiveItem();
    });

    _scrollController.addListener(() {
      _onScroll();
    });
    context.read<EnrolledProcessListCubit>().getEnrolledProcessList(widget.id);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Function to scroll to the active item
  void _scrollToActiveItem() {
    if (_scrollController.hasClients) {
      // Ensure the controller is attached
      double scrollPosition =
          activeIndex * itemWidth; // Correct the itemWidth calculation
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      // Try again after the frame is built
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _scrollToActiveItem());
    }
  }

  // Function that gets invoked when the scroll controller moves
  void _onScroll() {
    double currentScrollPosition = _scrollController.position.pixels;

    // Check each index to see if it's in view
    for (int i = 1; i <= totalItems; i++) {
      double indexPositionStart = (i - 1) * itemWidth;
      double indexPositionEnd = i * itemWidth;

      // Check if the scroll position is within the range of the current index
      if (currentScrollPosition >= indexPositionStart &&
          currentScrollPosition <= indexPositionEnd) {
        // Trigger function if this index hasn't been triggered yet
        if (!triggeredIndices.contains(i)) {
          HapticFeedback.mediumImpact(); // Invoke haptic feedback
          triggeredIndices.add(i); // Mark this index as triggered
        }
      } else {
        // Optionally reset if index goes out of view
        if (triggeredIndices.contains(i)) {
          triggeredIndices.remove(i);
        }
      }
    }
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: widget.practiceName,
        enableSuffixIcon: false,
      ),
      body: BlocBuilder<EnrolledProcessListCubit, EnrolledProcessListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e) => NetWorkError(
              onRefresh: () => context
                  .read<EnrolledProcessListCubit>()
                  .getEnrolledProcessList(widget.id),
            ),
            success: (m) {
              /// Updating active index and total index

              activeIndex = m.enrolledDetail?.activeProcess ?? 5;
              totalItems = m.enrolledDetail?.noProcess ?? 10;

              

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(inset.sm),
                  child: Column(
                    children: [
                      PracticeCardWidgetType2(
                        title: m.enrolledDetail?.practiceTask,
                        description: m.enrolledDetail?.description,
                        items: [
                          for (String txt
                              in m.enrolledDetail?.subCategories ?? [])
                            SmoothBorderChip(text: txt)
                        ],
                        onPressed: () {},
                      ),
                      Gap(inset.sm),
                      _buildSpecificLeaderboardsCard(
                          context, m.enrolledDetail?.practiceTask),
                      Gap(inset.sm),
                      Wrap(
                        runSpacing: 10,
                        spacing: 15,
                        alignment: WrapAlignment.center,
                        children: [
                          m.enrolledDetail?.isOngoing ?? false
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
                          m.enrolledDetail?.isSubmit ?? false
                              ? SmoothBorderChip(
                                  text: 'Submitted',
                                  bgColor: context.theme.statusGreen,
                                  textColor:
                                      context.theme.statusGreenAccentDark,
                                  borderColor: context.theme.statusGreen,
                                )
                              : SmoothBorderChip(
                                  text: 'Not Submitted',
                                  bgColor: context.theme.statusRed,
                                  textColor: context.theme.statusRedAccentDark,
                                  borderColor: context.theme.statusRed,
                                ),
                          if (m.enrolledDetail?.isReviewPending ?? false)
                            SmoothBorderChip(
                              text: 'Pending for Review',
                              bgColor: context.theme.statusYellow,
                              textColor: context.theme.statusYellowAccentDark,
                              borderColor: context.theme.statusYellow,
                            ),
                        ],
                      ),
                      // Practice Leaderboards
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: inset.md),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: kToolbarHeight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (int i = 0; i < totalItems; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: SmoothBorderChip(
                                      text: i < 10 ? ' ${i + 1} ' : '${i + 1}',
                                      bgColor: i < activeIndex
                                          ? context.theme.shareinfoGreen
                                          : context.theme.shareinfoYellow,
                                      disableBorder: true,
                                      style: $style.text.textBold14.copyWith(
                                        fontSize: 16,
                                        color: i < activeIndex
                                            ? context.theme.shareinfoWhite
                                            : context.theme.shareinfoWhite,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Animated progress bar
                      Stack(
                        children: [
                          // Inactive (full width, grey)
                          Container(
                            height: 5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: context.theme
                                  .shareinfoGreyLite, // Inactive part (grey)
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          // Gradient progress bar (from green to blue/yellow)
                          FractionallySizedBox(
                            widthFactor: activeIndex /
                                totalItems, // Based on activeIndex
                            child: AnimatedContainer(
                              duration: const Duration(
                                  seconds: 1), // Animation duration
                              curve: Curves.easeInOut, // Animation curve
                              height: 5,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    context.theme.shareinfoGreen,
                                    context.theme.shareinfoGreen,
                                    if (activeIndex < totalItems)
                                      context.theme
                                          .shareinfoYellow, // Transition to yellow
                                  ],
                                  begin: Alignment.centerLeft, // Start gradient
                                  end: Alignment.centerRight, // End gradient
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(inset.xxs),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: context.theme.shareinfoGreen,
                              thickness: 2,
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              text: TextSpan(
                                style: $style.text.textBold10.copyWith(
                                  color: context.theme.shareinfoGrey,
                                ),
                                text: 'Ends in ',
                                children: [
                                  TextSpan(
                                    text:
                                        '${m.enrolledDetail?.noDaysLeft} Days',
                                    style: $style.text.textBold12.copyWith(
                                      color: context.theme.shareinfoGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: context.theme.shareinfoGreen,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                      Gap(inset.sm),

                      /// Process List
                      ListView.separated(
                        separatorBuilder: (context, index) => Gap(inset.sm),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: m.processList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ExpandableCardWidget(
                            
                            //expandedCardNotifier: expandedList[index],
                            id: m.processList![index].id.toString(),
                            processName: m.processList?[index].processName,
                            processStep: (index + 1).toString(),
                            description: m
                                .processList?[index].taskDescription?[0]
                                .toString(),
                            status: m.processList?[index].status?.toTitleCase(),
                          );
                        },
                      ),
                      Gap(inset.lg),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Container _buildSpecificLeaderboardsCard(
      BuildContext context, String? title) {
    return Container(
      width: context.w * 100,
      height: 120,
      decoration: applySmoothBorder(
        context,
        borderColor: context.theme.shareinfoGreyLite,
        color: context.theme.lightBlue,
        width: 1.2,
      ),
      child: Stack(
        children: [
          Positioned(
            left: $style.insets.lg,
            top: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Practice Leaderboards',
                  style: $style.text.textBold12.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
                Text(
                  title ?? 'N/A',
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.shareinfoBlue,
                  ),
                ),
              ],
            ),
          ),
          _buildAvatar(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: TextButton(
                onPressed: () {
                  context.go(ScreenPath.practiceLeaderboards());
                },
                child: Text(
                  'Click to View',
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.shareinfoGrey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildAvatar() {
    return const Stack(
      children: [
        Positioned(
          right: 55,
          top: 20,
          child: CircleAvatar(
            radius: 15,
          ),
        ),
        Positioned(
          right: 17,
          top: 0,
          bottom: 0,
          child: CircleAvatar(
            radius: 20,
          ),
        ),
        Positioned(
          right: 57,
          bottom: 15,
          child: CircleAvatar(
            radius: 24,
          ),
        ),
      ],
    );
  }
}
