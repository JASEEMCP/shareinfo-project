import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:shareinfo/application/happening/event_register_cubit/event_register_cubit.dart';
import 'package:shareinfo/application/happening/happening_detail_cubit/happening_detail_cubit.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/happening/screens/youtube_player_screen.dart';
import 'package:shareinfo/presentation/widget/custom_chip_widget.dart';
import 'package:shareinfo/presentation/widget/custom_circular_icon_button.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';

class ScreenOccurredDetail extends StatelessWidget {
  const ScreenOccurredDetail({super.key, required this.eventId});

  final String eventId;

  String _changeDate(String dateStr) {
    // Parse the date string to a DateTime object
    DateTime dateTime = DateTime.parse(dateStr);

    // Format the DateTime object to the desired format
    String formattedDate = DateFormat('dd MMMM yyyy, EEEE').format(dateTime);

    return formattedDate;
  }

  String _convertTime(String timeStr) {
    // Parse the time string to a DateTime object
    DateTime dateTime = DateFormat('HH:mm:ss').parse(timeStr);

    // Format the DateTime object to the desired format
    String formattedTime = DateFormat('hh:mma').format(dateTime);

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    List<String> headings = [
      "What You'll Learn:",
      "Highlights:",
      "Who Should Attend:"
    ];
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<HappeningDetailCubit>().getEventDetail(eventId);
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, kTextTabBarHeight),
        child: BlocBuilder<HappeningDetailCubit, HappeningDetailState>(
          builder: (context, state) {
            final isSaved = state.maybeWhen(
              orElse: () => false,
              success: (model) => model.isSaved,
            );

            return AppBar(
              actions: [
                CircularIconButton(
                  icon: isSaved ?? false
                      ? Icons.bookmark
                      : Icons.bookmark_outline,
                  iconColor: context.theme.shareinfoBlue,
                  onPressed: () {
                    /// Saving happening
                    context
                        .read<HappeningDetailCubit>()
                        .saveHappening(eventId, isSaved ?? false);
                  },
                ),
                CircularIconButton(
                  icon: Icons.share,
                  onPressed: () {
                    shareHappeningLink(eventId);
                  },
                ),
              ],
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: context.theme.shareinfoGrey,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<HappeningDetailCubit, HappeningDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const CustomCircularProgressIndicatorC(),
            error: (e) => NetWorkError(
              onRefresh: () {
                context.read<HappeningDetailCubit>().getEventDetail(eventId);
              },
            ),
            success: (model) {
              final nestedList = [
                model.outcome,
                model.highlights,
                model.audience
              ];

              return Center(
                child: Container(
                  width: 600,
                  padding: customPaddingBottom(),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              padding: EdgeInsets.all(inset.md),
                              decoration: BoxDecoration(
                                color: context.theme.lightBlue.withOpacity(0.3),
                                borderRadius:
                                    BorderRadius.circular(15 + inset.sm),
                                border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 224, 224, 224),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      height: 160,
                                      width: context.w * 100,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            model.bannerImage ?? "",
                                            fit: BoxFit.cover,
                                            height: 160,
                                            width: context.w * 100,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Center(
                                                child: Icon(
                                                  Icons.video_collection,
                                                  size: 30,
                                                  color: Colors.grey.shade600,
                                                ),
                                              );
                                            },
                                            frameBuilder: (context, child,
                                                loadingProgress, s) {
                                              if (loadingProgress == null) {
                                                return Center(
                                                  child: Icon(
                                                    Icons.video_collection,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                );
                                              }
                                              return child;
                                            },
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    Color.fromARGB(87, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              focusColor: Colors.black,
                                              onPressed: () {
                                                if (model.videoUrl != null) {
                                                  context.pushR(
                                                    YoutubePlayerScreen(
                                                      videoUrl: model.videoUrl,
                                                    ),
                                                  );
                                                }
                                              },
                                              icon: Icon(
                                                Icons.play_arrow_rounded,
                                                size: 40,
                                                color: Colors.grey.shade100,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Gap(inset.sm),
                                  Text(
                                    model.title ?? 'N/A',
                                    textScaler: const TextScaler.linear(1),
                                    textAlign: TextAlign.left,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: $style.text.textBold16.copyWith(
                                      color: context.theme.shareinfoBlue,
                                      height: 1.2,
                                    ),
                                  ),
                                  Gap(inset.xs),

                                  /// Faculty data
                                  Row(
                                    children: [
                                      ClipRRect(
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            model.organizerImage ?? '',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Center(
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.grey.shade600,
                                                ),
                                              );
                                            },
                                            frameBuilder: (context, child,
                                                loadingProgress, s) {
                                              if (loadingProgress == null) {
                                                return Center(
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                );
                                              }
                                              return child;
                                            },
                                          ),
                                        ),
                                      ),
                                      Gap(inset.xxs),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model.organizerName ?? 'N/A',
                                            textScaler:
                                                const TextScaler.linear(1),
                                            maxLines: 1,
                                            style:
                                                $style.text.textBold12.copyWith(
                                              color:
                                                  context.theme.shareinfoGrey,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                model.organizerRole ?? 'N/A',
                                                textScaler:
                                                    const TextScaler.linear(1),
                                                maxLines: 1,
                                                style: $style.text.textBold12
                                                    .copyWith(
                                                  color: context
                                                      .theme.shareinfoTextDark,
                                                ),
                                              ),
                                              Text(
                                                " ${model.organizerCompany ?? 'N/A'}",
                                                textScaler:
                                                    const TextScaler.linear(1),
                                                maxLines: 1,
                                                style: $style.text.textBold12
                                                    .copyWith(
                                                  color: context
                                                      .theme.shareinfoTextDark,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Gap(inset.sm),

                                  /// Joined people count
                                  _buildIconText(
                                    context,
                                    '${model.registrationCount ?? 0} People Attended',
                                    Icons.group_work_outlined,
                                  ),
                                  Gap(inset.sm),

                                  /// Time and date
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        _buildIconText(
                                          context,
                                          _changeDate(
                                              model.date ?? '2024-07-04'),
                                          Icons.calendar_month_outlined,
                                        ),
                                        const Gap(15),
                                        _buildIconText(
                                          context,
                                          '${_convertTime(model.time ?? '16:21:24')} IST',
                                          Icons.alarm_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(inset.md),

                                  /// Contents
                                  Text(
                                    'Skills and Your Interested Fields',
                                    textScaler: const TextScaler.linear(1),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: $style.text.textBold14.copyWith(
                                      color: context.theme.shareinfoBlue,
                                      height: 1.2,
                                    ),
                                  ),
                                  Gap(inset.xs),
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      for (int i = 0;
                                          i < model.skills!.length;
                                          i++)
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomChipWidget(
                                              chipText: model.skills![i],
                                              textColor:
                                                  context.theme.shareinfoBlue,
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  Gap(inset.sm),
                                  // Description
                                  Text(
                                    model.description ?? 'N/A',
                                    textScaler: const TextScaler.linear(1),
                                    style: $style.text.textSBold12.copyWith(
                                      color: context.theme.shareinfoTextDark,
                                    ),
                                  ),
                                  Gap(inset.xs),
                                  for (int i = 0; i < headings.length; i++)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          headings[i],
                                          textScaler:
                                              const TextScaler.linear(1),
                                          textAlign: TextAlign.left,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              $style.text.textBold14.copyWith(
                                            color: context.theme.shareinfoBlue,
                                            height: 1.2,
                                          ),
                                        ),
                                        for (int j = 0;
                                            j < nestedList[i]!.length;
                                            j++)
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: inset.xs,
                                              right: inset.md,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "\u2022",
                                                  style: $style.text.textBold12
                                                      .copyWith(
                                                    color: context.theme
                                                        .shareinfoTextDark,
                                                  ),
                                                ),
                                                Gap(inset.xs),
                                                Expanded(
                                                  child: Text(
                                                    nestedList[i]![j],
                                                    style: $style
                                                        .text.textSBold12
                                                        .copyWith(
                                                      color: context.theme
                                                          .shareinfoTextDark,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        Gap(inset.xs),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Gap(inset.sm),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          BlocBuilder<HappeningDetailCubit,
                              HappeningDetailState>(
                            builder: (context, stateX) {
                              String? videoUrl = stateX.maybeWhen(
                                orElse: () => null,
                                success: (model) => model.videoUrl,
                              );

                              return stateX.isError || stateX.isLoading
                                  ? const SizedBox.shrink()
                                  : (model.isRegistered ?? false) &&
                                          !(model.isRated ?? false)
                                      ? Expanded(
                                          child: CustomElevatedButton(
                                            buttonName: 'Show My Registration',
                                            width: ElevatedButtonWidth.large,
                                            onPressed: () {
                                              context.push(
                                                  ScreenPath.happeningPreview(
                                                      eventId));
                                            },
                                          ),
                                        )
                                      : Expanded(
                                          child: CustomElevatedButton(
                                            buttonName: 'Watch on Youtube',
                                            width: ElevatedButtonWidth.large,
                                            onPressed: () {
                                              if (videoUrl != null) {
                                                openWeb(videoUrl);
                                              }
                                            },
                                          ),
                                        );
                            },
                          ),
                        ],
                      ),
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

  Row _buildIconText(BuildContext context, String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        Text(
          text,
          textScaler: const TextScaler.linear(1),
          maxLines: 1,
          style: $style.text.textBold12.copyWith(
            color: context.theme.shareinfoGrey,
          ),
        ),
      ],
    );
  }
}

Future<Object?> showEventRegistrationAlert(
    BuildContext context, String eventId) {
  return showGeneralDialog(
    context: context,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: PopScope(
          canPop: false,
          child: SizedBox(
            width: 200,
            child: AlertDialog(
              surfaceTintColor: context.theme.shareinfoWhite,
              actionsAlignment: MainAxisAlignment.center,
              scrollable: true,
              actionsOverflowButtonSpacing: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              ),
              title: Center(
                child: Text(
                  'Are You Sure Want to\nPre-Book the Event',
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.center,
                  style: $style.text.textSBold18.copyWith(
                    color: context.theme.shareinfoBlue,
                  ),
                ),
              ),
              actions: [
                Center(
                  child: CustomElevatedButton(
                    buttonName: 'Cancel',
                    backgroundColor: context.theme.statusBlue,
                    buttonTextColor: context.theme.statusBlueAccentDark,
                    width: ElevatedButtonWidth.medium,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
                Center(
                  child: CustomElevatedButton(
                    buttonName: 'Confirm',
                    width: ElevatedButtonWidth.medium,
                    onPressed: () {
                      ///Registering events
                      context.pop();
                      context.read<EventRegisterCubit>().registerEvent(eventId);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
