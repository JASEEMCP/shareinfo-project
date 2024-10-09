import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_chip_widget.dart';
import 'package:shareinfo/presentation/widget/logo_frame_widget.dart';

class StatusTileWidget extends StatelessWidget {
  const StatusTileWidget({
    super.key,
    required this.onPressed,
    this.onSaved,
    this.title,
    this.companyName,
    this.status,
    this.logo,
  });
  final Function onPressed;
  final Function? onSaved;
  final String? title;
  final String? companyName;
  final String? status;
  final String? logo;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final statusColorSet = getStatusColorSet(status ?? '');
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: inset.lg),
          margin: EdgeInsets.symmetric(horizontal: inset.md),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: context.theme.shareinfoGreyLite,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: LogoFrameWidget(
                      imagePath: logo ?? ImagePaths.shareInfoLogo,
                      imageSize: inset.offset,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: inset.offset + 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'N/A',
                          textScaler: const TextScaler.linear(1),
                          style: $style.text.textBold16.copyWith(
                            color: context.theme.imiotDarkPurple,
                          ),
                        ),
                        Text(
                          companyName ?? 'N/A',
                          textScaler: const TextScaler.linear(1),
                          style: $style.text.textSBold12.copyWith(
                            color: context.theme.shareinfoGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: inset.offset + 10,
                      top: inset.offset + 5,
                      right: inset.md,
                    ),
                    child: Wrap(
                      runSpacing: inset.xs,
                      spacing: inset.xs,
                      children: [
                        Row(
                          children: [
                            CustomChipWidget(
                              chipText: 'Application $status',
                              backgroundColor: statusColorSet.background,
                              bordercolor: Colors.transparent,
                              textColor: statusColorSet.textColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: inset.sm + 1,
                      color: context.theme.imiotDarkPurple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
