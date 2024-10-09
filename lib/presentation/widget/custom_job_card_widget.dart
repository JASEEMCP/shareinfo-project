import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

import 'custom_chip_widget.dart';
import 'logo_frame_widget.dart';

class CustomJobCardWidget extends StatelessWidget {
  CustomJobCardWidget({
    super.key,
    required this.onPressed,
    this.onSaved,
    this.desc5,
    this.title,
    this.subtitle,
    this.location,
    this.description,
    this.isSaved = false,
    this.workingMode,
    this.isCampus,
    required this.companyLogo,
  });
  final Function onPressed;
  final Function? onSaved;
  final String? desc5;
  final String? title;
  final String? subtitle;
  final String? location;
  final String? description;
  final bool? isSaved;
  final String? workingMode;
  final bool? isCampus;
  final String companyLogo;
  final Debouncer _debounceBtn = Debouncer(const Duration(milliseconds: 230));
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(inset.xl),
        onTap: () {
          _debounceBtn.call(
            () {
              onPressed();
            },
          );
        },
        child: Container(
          //padding: EdgeInsets.only(bottom: inset.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(inset.xl),
            border: Border.all(
              color: context.theme.shareinfoGreyLite,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  //Company name
                  Padding(
                    padding: EdgeInsets.only(
                      top: inset.md,
                      left: 70 + inset.sm,
                      right: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            title ?? 'N/A',
                            textScaler: const TextScaler.linear(1),
                            style: $style.text.textBold14.copyWith(
                              color: context.theme.imiotDarkPurple,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          subtitle ?? 'N/A',
                          textScaler: const TextScaler.linear(1),
                          style: $style.text.textBold12.copyWith(
                            color:
                                context.theme.imiotDeepPurple.withOpacity(0.6),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Company logo and book mark
                  Padding(
                    padding: EdgeInsets.only(
                      top: inset.md,
                      left: 18,
                      right: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LogoFrameWidget(
                          imagePath: companyLogo,
                          imageSize: 50,
                        ),
                        IconButton(
                          onPressed: () {
                            HapticFeedback.mediumImpact();
                            onSaved == null ? () {} : onSaved!();
                          },
                          icon: Icon(
                            isSaved! ? Icons.bookmark : Icons.bookmark_outline,
                            size: inset.lg,
                            color: context.theme.shareinfoBlue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Divider
                  Padding(
                    padding: EdgeInsets.only(top: 60 + inset.xs),
                    child: Divider(
                      color: context.theme.shareinfoGreyLite,
                      endIndent: 18,
                      indent: 18,
                    ),
                  ),
                  //Company description
                  Padding(
                    padding: EdgeInsets.only(
                      top: 70,
                      left: 70 + inset.sm,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(inset.xs + 10),
                        Text(
                          location ?? 'N/A',
                          textScaler: const TextScaler.linear(1),
                          style: $style.text.textBold12.copyWith(
                            color: context.theme.shareinfoTextDark,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: context.w * 35,
                                padding:
                                    EdgeInsets.symmetric(vertical: inset.xs),
                                child: Text(
                                  description ?? 'N/A',
                                  style: $style.text.textBold10.copyWith(
                                    color: context.theme.imiotDarkPurple,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Row(
                            children: [
                              CustomChipWidget(
                                chipText: workingMode ?? 'N/A',
                              ),
                              Gap(inset.sm),
                              CustomChipWidget(
                                chipText: isCampus == null
                                    ? 'N/A'
                                    : isCampus!
                                        ? "Campus Recruitment"
                                        : "Open Recruitment",
                              ),
                            ],
                          ),
                        ),
                      ],
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
