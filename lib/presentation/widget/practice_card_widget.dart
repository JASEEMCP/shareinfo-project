import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';

class PracticeCardWidget extends StatelessWidget {
  const PracticeCardWidget({
    super.key,
    required this.onPressed,
    this.title,
    this.description,
    this.category,
    this.isEnrolled,
    this.perks,
  });
  final Function() onPressed;
  final String? title;
  final String? description;
  final String? category;
  final bool? isEnrolled;
  final String? perks;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final text = $style.text;
    return Container(
      padding: EdgeInsets.all(inset.sm),
      decoration: applySmoothBorder(
        context,
        width: 1.5,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: text.textBold16.copyWith(
                  color: context.theme.imiotDarkPurple,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                description ?? '',
                maxLines: 3,
                style: text.textSBold10.copyWith(
                  color: context.theme.imiotDarkPurple,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(inset.xs),
              Wrap(
                runSpacing: 5,
                spacing: 10,
                children: [
                  const SmoothBorderChip(text: 'MCQ'),
                  SmoothBorderChip(text: category ?? 'N/A'),
                  const SmoothBorderChip(text: 'Leaderboards'),
                  const SmoothBorderChip(text: 'Goodies'),
                ],
              ),
              Gap(inset.sm),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothBorderChip(
                  text: '$perks Perks',
                  bgColor: context.theme.shareinfoBlue,
                  textColor: context.theme.shareinfoWhite,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(inset.xs),
                        bottomRight: Radius.circular(inset.xl),
                        topRight: Radius.circular(inset.xs),
                        topLeft: Radius.circular(inset.xl),
                      ),
                    ),
                    backgroundColor: context.theme.shareinfoBlue,
                  ),
                  child: Text(
                    'Enroll Now.!',
                    style: text.textSBold12.copyWith(
                      color: context.theme.shareinfoWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PracticeCardWidgetType2 extends StatelessWidget {
  const PracticeCardWidgetType2({
    super.key,
    required this.onPressed,
    required this.items,
    this.title,
    this.description,
  });
  final Function() onPressed;
  final List<SmoothBorderChip> items;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final text = $style.text;
    return Material(
      child: InkWell(
        splashFactory: InkSparkle.splashFactory,
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          width: context.w * 100,
          padding: EdgeInsets.all(inset.sm),
          decoration: applySmoothBorder(
            context,
            width: 1.2,
            color: Colors.transparent,
            borderColor: context.theme.shareinfoLightBlue,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'N/A',
                    style: text.textBold16.copyWith(
                      color: context.theme.imiotDarkPurple,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    description ?? 'N/A',
                    maxLines: 3,
                    style: text.textSBold10.copyWith(
                      color: context.theme.imiotDarkPurple,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Gap(inset.xs),
                  Wrap(runSpacing: 10, spacing: 15, children: items),
                  Gap(inset.sm),
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SmoothBorderChip(
                    //   text: '20 Perks',
                    //   bgColor: context.theme.shareinfoWhite,
                    //   textColor: context.theme.shareinfoOrange,
                    //   disableBorder: true,
                    // ),
                    // ElevatedButton(
                    //   onPressed: onPressed,
                    //   style: TextButton.styleFrom(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(inset.xs),
                    //         topRight: Radius.circular(inset.xs),
                    //         bottomRight: Radius.circular(inset.sm + 3),
                    //         topLeft: Radius.circular(inset.sm + 3),
                    //       ),
                    //     ),
                    //     backgroundColor: context.theme.shareinfoBlue,
                    //   ),
                    //   child: Text(
                    //     'Enroll Now.!',
                    //     style: text.textSBold12.copyWith(
                    //       color: context.theme.shareinfoWhite,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
