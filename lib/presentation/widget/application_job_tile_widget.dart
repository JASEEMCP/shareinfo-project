import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'custom_chip_widget.dart';
import 'logo_frame_widget.dart';

class ApplicationJobTilWidget extends StatelessWidget {
  const ApplicationJobTilWidget({
    super.key,
    required this.onPressed,
    this.onSaved,
    this.desc5,
    required this.isFinalItem,
    this.title,
    this.subTitle,
    this.location,
    this.lpaRange,
    this.applicationCount,
    this.workingMode,
    this.isCampus = false,
    this.applicationStatus,
    this.imagePath,
    required this.companyLogo,
  });
  final Function onPressed;
  final Function? onSaved;
  final String? desc5;
  final bool isFinalItem;
  final String? title;
  final String? subTitle;
  final String? location;
  final String? lpaRange;
  final int? applicationCount;
  final String? workingMode;
  final bool? isCampus;
  final String? applicationStatus;
  final String? imagePath;
  final String companyLogo;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final statusColorSet = getStatusColorSet(applicationStatus ?? '');
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          width: 90 * context.w,
          margin: EdgeInsets.symmetric(horizontal: inset.sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  //Company name
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5 * context.w, left: 20 * context.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'N/A',
                          textScaler: const TextScaler.linear(1),
                          style: $style.text.textBold16.copyWith(
                            color: context.theme.imiotDarkPurple,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          subTitle ?? 'N/A',
                          textScaler: const TextScaler.linear(1),
                          style: $style.text.textBold14.copyWith(
                            color: context.theme.shareinfoTextDark,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Company logo and book mark
                  Padding(
                    padding: EdgeInsets.only(
                      top: context.w * 5,
                      left: context.w * 5,
                      right: context.w * 3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LogoFrameWidget(
                          imagePath: companyLogo,
                          imageSize: inset.offset,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: inset.xl,
                          color: context.theme.shareinfoGrey,
                        ),
                      ],
                    ),
                  ),

                  //Divider
                  Padding(
                    padding: EdgeInsets.only(
                      top: 18 * context.w,
                    ),
                    child: Divider(
                      color: context.theme.shareinfoGreyLite,
                      endIndent: 5 * context.w,
                      indent: 5 * context.w,
                    ),
                  ),
                  //Company description
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20 * context.w,
                      left: 20 * context.w,
                      right: 5 * context.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(inset.xs),
                        SizedBox(
                          width: 75 * context.w,
                          child: Text(
                            location ?? 'N/A',
                            textScaler: const TextScaler.linear(1),
                            style: $style.text.textBold12.copyWith(
                              color: context.theme.shareinfoTextDark,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Row(
                            children: [
                              Container(
                                width: 37 * context.w,
                                padding:
                                    EdgeInsets.symmetric(vertical: inset.xs),
                                child: Text(
                                  lpaRange ?? 'N/A',
                                  style: $style.text.textBold10.copyWith(
                                    color: context.theme.imiotDarkPurple,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              //Checking if there have a extra contents
                              desc5 != null
                                  ? Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: inset.xs),
                                        child: Text(
                                          "${(applicationCount ?? 0) < 99 ? applicationCount : '${100}+'} Application",
                                          style:
                                              $style.text.textBold10.copyWith(
                                            color:
                                                context.theme.imiotDarkPurple,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 6 * context.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomChipWidget(
                                  chipText: workingMode ?? 'N/A',
                                ),
                              ),
                              Gap(inset.sm),
                              Expanded(
                                child: CustomChipWidget(
                                  chipText: isCampus!
                                      ? 'Campus Recruitment'
                                      : 'Open Recruitment',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(inset.xs),
                        SizedBox(
                          width: ('Application $applicationStatus')
                                  .length
                                  .toDouble() *
                              8,
                          child: CustomChipWidget(
                            chipText: 'Application $applicationStatus',
                            bordercolor: statusColorSet.textColor,
                            backgroundColor: statusColorSet.background,
                            textColor: statusColorSet.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(inset.sm),
              !isFinalItem
                  ? Divider(color: context.theme.shareinfoGreyLite)
                  : Gap(inset.sm),
            ],
          ),
        ),
      ),
    );
  }
}
