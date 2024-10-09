import 'package:intl/intl.dart';
import 'package:shareinfo/application/happening/event_preview_cubit/event_preview_cubit.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';

class ScreenEventPreview extends StatelessWidget {
  const ScreenEventPreview({super.key, required this.eventId});

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
    bool? isSessionEnded;
    bool? isJoinable;
    bool? isRated;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<EventPreviewCubit>().getEventPreview(eventId);
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.theme.shareinfoGrey,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocBuilder<EventPreviewCubit, EventPreviewState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const CustomCircularProgressIndicatorC(),
            error: (e) => NetWorkError(
              onRefresh: () {
                context.read<EventPreviewCubit>().getEventPreview(eventId);
              },
            ),
            success: (model) {
              return Padding(
                padding: EdgeInsets.all(inset.md),
                child: Center(
                  child: SizedBox(
                    width: 600,
                    child: ListView(
                      children: [
                        Text(
                          'Slot Reserved',
                          textScaler: const TextScaler.linear(1),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: $style.text.textBold16.copyWith(
                            color: context.theme.shareinfoBlack,
                          ),
                        ),
                        Gap(inset.xs),
                        Text(
                          'Event Details',
                          textScaler: const TextScaler.linear(1),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.shareinfoGrey,
                          ),
                        ),
                        Gap(inset.xs),

                        /// Event title
                        Container(
                          padding: EdgeInsets.all(inset.md),
                          decoration: BoxDecoration(
                            color: context.theme.lightBlue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15 + inset.sm),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,
                                width: context.w * 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(
                                  model.bannerImage ?? '',
                                  fit: BoxFit.fill,
                                  height: 160,
                                  width: context.w * 100,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 30,
                                        color: Colors.grey.shade600,
                                      ),
                                    );
                                  },
                                  frameBuilder:
                                      (context, child, loadingProgress, s) {
                                    if (loadingProgress == null) {
                                      return Center(
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.grey.shade600,
                                        ),
                                      );
                                    }
                                    return child;
                                  },
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
                            ],
                          ),
                        ),
                        Gap(inset.xs),

                        /// Speaker detail
                        Text(
                          'Speaker',
                          textScaler: const TextScaler.linear(1),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.shareinfoBlack,
                          ),
                        ),
                        Gap(inset.xs),

                        /// Speaker profile
                        ClipRRect(
                          child: Container(
                            height: 90,
                            width: 90,
                            clipBehavior: Clip.hardEdge,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              model.organizerImage ?? '',
                              fit: BoxFit.cover,
                              height: 90,
                              width: 90,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade600,
                                  ),
                                );
                              },
                              frameBuilder:
                                  (context, child, loadingProgress, s) {
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
                        Text(
                          model.organizerName ?? 'N/A',
                          textScaler: const TextScaler.linear(1),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: $style.text.textBold14.copyWith(
                            color: context.theme.shareinfoBlue,
                          ),
                        ),
                        Text(
                          model.organizerRole ?? 'N/A',
                          textAlign: TextAlign.center,
                          textScaler: const TextScaler.linear(1),
                          maxLines: 1,
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.shareinfoGrey,
                          ),
                        ),
                        Text(
                          model.organizerCompany ?? 'N/A',
                          textAlign: TextAlign.center,
                          textScaler: const TextScaler.linear(1),
                          maxLines: 1,
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.shareinfoGrey,
                          ),
                        ),
                        Gap(inset.sm),
                        Text(
                          'Schedule',
                          textScaler: const TextScaler.linear(1),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.shareinfoBlack,
                          ),
                        ),
                        Gap(inset.xs),
                        _buildIconText(
                          context,
                          _changeDate(model.date ?? '2024-07-04'),
                          Icons.calendar_month_outlined,
                        ),
                        Gap(inset.xs),
                        _buildIconText(
                          context,
                          '${_convertTime(model.time ?? '16:21:24')} IST',
                          Icons.alarm_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          final state = context.watch<EventPreviewCubit>().state;
          isJoinable = state.maybeWhen(
            orElse: () => false,
            success: (model) => model.isJoinable,
          );
          isSessionEnded = state.maybeWhen(
            orElse: () => false,
            success: (model) => model.isSessionEnded,
          );
          isRated = state.maybeWhen(
            orElse: () => false,
            success: (model) => model.isRated,
          );
          final sessionUrl = state.maybeWhen(
            orElse: () => null,
            success: (model) => model.url,
          );

          return state.isLoading || state.isError
              ? const SizedBox.shrink()
              // Checking feedback completed or not
              : (isRated ?? false)
                  ? const SizedBox.shrink()
                  // Check Session ended or not
                  : isSessionEnded ?? false
                      ? Padding(
                          padding: customPaddingBottom(),
                          child: CustomElevatedButton(
                            buttonName: 'Send Feedback',
                            width: ElevatedButtonWidth.large,
                            onPressed: () {
                              context
                                  .push(ScreenPath.happeningFeedback(eventId));
                            },
                          ),
                        )
                      : Padding(
                          padding: customPaddingBottom(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Link Will Automatically Activate 10 Minutes before the Session',
                                textAlign: TextAlign.center,
                                textScaler: const TextScaler.linear(1),
                                maxLines: 2,
                                style: $style.text.textBold12.copyWith(
                                  color: context.theme.shareinfoGrey,
                                ),
                              ),
                              SizedBox(
                                width: 350,
                                child: CustomElevatedButton(
                                  buttonName: 'Join the Session Now!',
                                  width: ElevatedButtonWidth.large,
                                  backgroundColor: isJoinable ?? false
                                      ? null
                                      : context.theme.statusBlueAccentDark
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    /// Check join url is activated or not
                                    if (isJoinable ?? false) {
                                      openWeb(sessionUrl);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
        },
      ),
    );
  }

  Row _buildIconText(BuildContext context, String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: context.theme.shareinfoGrey,
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
