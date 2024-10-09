import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:shareinfo/domain/practice/models/leaderboards_model/logged_in_candidate.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';

ShapeDecoration applySmoothBorder(
  BuildContext context, {
  double? radius,
  bool? disableBorder = false,
  Color? color,
  Color? borderColor,
  double? width,
}) {
  return ShapeDecoration(
    color: color ?? context.theme.shareinfoWhite,
    shape: SmoothRectangleBorder(
      side: disableBorder!
          ? BorderSide.none
          : BorderSide(
              color: borderColor ?? context.theme.shareinfoBlue,
              width: width ?? 2,
            ),
      borderRadius: SmoothBorderRadius(
        cornerRadius: radius ?? 20,
        cornerSmoothing: 1,
      ),
    ),
  );
}

class SmoothBorderChip extends StatelessWidget {
  const SmoothBorderChip({
    super.key,
    required this.text,
    this.bgColor,
    this.textColor,
    this.disableBorder,
    this.style,
    this.borderColor,
  });
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final bool? disableBorder;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: applySmoothBorder(
        context,
        radius: 5,
        width: 1.5,
        color: bgColor,
        disableBorder: disableBorder ?? false,
        borderColor: borderColor,
      ),
      child: Text(
        text,
        textScaler: const TextScaler.linear(1),
        style: style ??
            $style.text.textBold12.copyWith(
              color: textColor ?? context.theme.imiotDarkPurple,
            ),
      ),
    );
  }
}

class LeaderboardsTileWidget extends StatelessWidget {
  const LeaderboardsTileWidget({
    super.key,
    this.candidateData,
    required this.isLoggedUser,
  });
  final bool isLoggedUser;
  final LoggedInCandidate? candidateData;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return ListTile(
      onTap: () {},
      shape: SmoothRectangleBorder(
        side: BorderSide(
          color: context.theme.shareinfoGreyLite,
          width: 2,
        ),
        borderRadius: SmoothBorderRadius(
          cornerRadius: 15,
          cornerSmoothing: 1,
        ),
      ),
      tileColor: context.theme.lightBlue,
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.orangeAccent,
      ),
      contentPadding: EdgeInsets.only(left: inset.xxs),
      minVerticalPadding: 20,
      title: Text(
        "${candidateData?.candidateName ?? ''} ${isLoggedUser ? "(You)" : ""}",
        style: $style.text.textBold14.copyWith(
          color: context.theme.imiotDarkPurple,
        ),
      ),
      subtitle: Text(
        'Practice Score : ${candidateData?.totalPerks}',
        style: $style.text.textBold10.copyWith(
          color: context.theme.shareinfoTextDark,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${candidateData?.rank}",
            style: $style.text.textBold10.copyWith(
              color: context.theme.shareinfoGreen,
            ),
          ),
          Gap(inset.xxxs),
          Icon(
            Icons.arrow_circle_up_outlined,
            color: context.theme.shareinfoRed,
            size: 18,
          ),
          Gap(inset.xs),
        ],
      ),
    );
  }
}

Future<Object?> showSubmissionAlert(
  BuildContext context, {
  Function()? onSubmit,
  Function()? onCancel,
  String? content,
  String? submitText,
  String? cancelText,
  bool? isLoading,
}) {
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
              clipBehavior: Clip.hardEdge,
              surfaceTintColor: context.theme.shareinfoWhite,
              actionsAlignment: MainAxisAlignment.center,
              scrollable: true,
              actionsOverflowButtonSpacing: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              ),
              title: Center(
                child: Text(
                  content ?? 'Are You Sure Want to\nEnroll Practice!',
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
                    onPressed: onCancel ??
                        () {
                          context.pop();
                        },
                  ),
                ),
                Center(
                  child: CustomElevatedButton(
                    buttonName: 'Confirm',
                    isLoading: isLoading,
                    width: ElevatedButtonWidth.medium,
                    onPressed: onSubmit ?? () {},
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

class LeaderboardsTileWidgetType2 extends StatelessWidget {
  const LeaderboardsTileWidgetType2({
    super.key,
    this.name,
    required this.isLoggedUser,
    this.submittedDate,
    this.perks,
  });
  final bool isLoggedUser;
  final String? name;
  final String? submittedDate;
  final String? perks;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return ListTile(
      onTap: () {},
      shape: SmoothRectangleBorder(
        side: BorderSide(
          color: context.theme.shareinfoGreyLite,
          width: 2,
        ),
        borderRadius: SmoothBorderRadius(
          cornerRadius: 15,
          cornerSmoothing: 1,
        ),
      ),
      tileColor: context.theme.lightBlue,
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.orangeAccent,
      ),
      contentPadding: EdgeInsets.only(left: inset.xxs),
      minVerticalPadding: 20,
      title: Text(
        "$name ${isLoggedUser ? "(You)" : ""}",
        style: $style.text.textBold14.copyWith(
          color: context.theme.imiotDarkPurple,
        ),
      ),
      subtitle: Text(
        'Submitted on : $submittedDate',
        style: $style.text.textBold10.copyWith(
          color: context.theme.shareinfoTextDark,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$perks",
            style: $style.text.textBold10.copyWith(
              color: context.theme.shareinfoGreen,
            ),
          ),
          Gap(inset.xxxs),
          Icon(
            Icons.arrow_circle_up_outlined,
            color: context.theme.shareinfoRed,
            size: 18,
          ),
          Gap(inset.xs),
        ],
      ),
    );
  }
}
