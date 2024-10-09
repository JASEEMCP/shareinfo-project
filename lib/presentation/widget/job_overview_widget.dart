import 'package:shareinfo/presentation/core/common_lib.dart';

import 'package:shareinfo/presentation/widget/custom_chip_widget.dart';
import 'package:shareinfo/presentation/widget/logo_frame_widget.dart';

class JobOverViewWidget extends StatelessWidget {
  const JobOverViewWidget({
    super.key,
    this.enableExpireDate = false,
    this.jobTitle,
    this.companyName,
    this.location,
    this.startDate,
    this.workingMode,
    this.isCampus = false,
    this.instituteName,
    this.endDate,
    this.salaryType,
    this.maxSalary,
    this.minSalary,
    this.companyLogo,
  });
  final bool? enableExpireDate;
  final String? jobTitle;
  final String? companyName;
  final String? location;
  final String? salaryType;
  final int? maxSalary;
  final int? minSalary;
  final String? startDate;
  final String? endDate;
  final String? workingMode;
  final String? instituteName;
  final bool? isCampus;
  final String? companyLogo;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final String? daysAgo =
        Date.difference(startDate, DateTime.now().toString()).countWithText;
    final String? expireIn =
        Date.difference(DateTime.now().toString(), endDate).countWithText;

    return Container(
      width: 300,
      padding: EdgeInsets.all(inset.xl),
      margin: EdgeInsets.only(
        left: inset.lg,
        right: inset.lg,
        bottom: inset.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(inset.xl),
        border: Border.all(
          color: context.theme.shareinfoGreyLite,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoFrameWidget(
                imagePath: companyLogo ?? '',
                imageSize: 55,
              ),
            ],
          ),
          Gap(inset.xs),
          Text(
            jobTitle ?? 'N/A',
            textScaler: const TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: $style.text.textBold14.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
          Gap(inset.xxs),
          Text(
            companyName ?? 'N/A',
            textScaler: const TextScaler.linear(1),
            style: $style.text.textBold12.copyWith(
              color: context.theme.shareinfoMidBlue,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          isCampus!
              ? RichText(
                  text: TextSpan(
                    text: "Campus Drive: ",
                    style: $style.text.textBold10.copyWith(
                        color: context.theme.shareinfoMidBlue,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Nunito'),
                    children: [
                      TextSpan(
                        text: '${instituteName ?? 'N/A'} ',
                        style: $style.text.textBold10.copyWith(
                            color: context.theme.imiotDarkPurple,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Nunito'),
                      ),
                      TextSpan(
                        text: 'Exclusive',
                        style: $style.text.textBold10.copyWith(
                            color: context.theme.shareinfoMidBlue,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Nunito'),
                      ),
                    ],
                  ),
                  textScaler: const TextScaler.linear(1),
                )
              : const SizedBox.shrink(),
          Gap(inset.xs),
          Divider(
            color: context.theme.shareinfoGreyLite,
          ),
          Gap(inset.xs),
          Text(
            location ?? 'N/A',
            textScaler: const TextScaler.linear(1),
            style: $style.text.textBold12.copyWith(
              color: context.theme.shareinfoTextDark,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(inset.xxs),
          salaryType == 'Onwards'
              ? Text(
                  '₹ ${getSalaryToLpa(minSalary)} LPA - onwards',
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.shareinfoMidBlue,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : salaryType == 'Range'
                  ? Text(
                      '${getSalaryToLpa(minSalary)} LPA to ${getSalaryToLpa(maxSalary)} LPA',
                      style: $style.text.textBold10.copyWith(
                        color: context.theme.shareinfoMidBlue,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : Text(
                      '${getSalaryToLpa(minSalary)} LPA',
                      style: $style.text.textBold10.copyWith(
                        color: context.theme.shareinfoMidBlue,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
          Gap(inset.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomChipWidget(chipText: workingMode ?? 'N/A'),
              Gap(inset.sm),
              CustomChipWidget(
                chipText: isCampus ?? false
                    ? "Campus Recruitment"
                    : "Open Recruitment",
              ),
            ],
          ),
          Gap(inset.md),
          enableExpireDate!
              ? Text(
                  daysAgo == '0 Days'
                      ? "Posted Today, Ends in $expireIn"
                      : "Posted on $daysAgo ago, ${expireIn == '0 Days' ? 'Ends Today' : 'Ends in $expireIn'}",
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.shareinfoTextDark,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
