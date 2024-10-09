import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class GeneralTileWidget extends StatelessWidget {
  const GeneralTileWidget({
    super.key,
    this.title,
    this.time,
    this.date,
    this.body,
    required this.onTap,
    required this.isCollapsed,
    required this.unRead,
  });
  final String? title;
  final String? time;
  final String? date;
  final String? body;
  final Function onTap;
  final bool isCollapsed;
  final bool unRead;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.only(
            top: inset.md,
            bottom: inset.md,
            right: inset.sm,
          ),
          margin: EdgeInsets.symmetric(horizontal: inset.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Container(
                      height: inset.offset,
                      width: inset.offset,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(ImagePaths.shareInfoLogo),
                    ),
                    Gap(inset.xs),
                    SizedBox(
                      width: 50 * context.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? 'N/A',
                            style: $style.text.textBold16.copyWith(
                              color: context.theme.imiotDarkPurple,
                            ),
                          ),
                          Text(
                            "$date | $time",
                            style: $style.text.textBold10.copyWith(
                              color: context.theme.shareinfoTextDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                unRead
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: inset.xs),
                        decoration: BoxDecoration(
                          color: context.theme.shareinfoBlue,
                          borderRadius: BorderRadius.circular(inset.xxxs),
                        ),
                        child: Text(
                          "New",
                          textScaler: const TextScaler.linear(1),
                          style: $style.text.textBold10.copyWith(
                            color: context.theme.shareinfoWhite,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ]),
              Gap(inset.xs),
              Text(
                body ?? 'N/A',
                maxLines: isCollapsed ? 4 : null,
                style: $style.text.textSBold10.copyWith(
                  color: context.theme.shareinfoTextDark,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
