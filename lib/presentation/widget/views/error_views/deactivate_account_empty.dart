import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class DeactivateAccountMessage extends StatelessWidget {
  const DeactivateAccountMessage({
    super.key,
    this.padding,
  });
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: kToolbarHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Deactivate Account ?',
            textAlign: TextAlign.center,
            style: $style.text.textBold26.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
          const Gap(10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10 * context.w),
            width: "Deactivate Account ?".length.toDouble() * 13,
            child: Text(
              'You will lose all completed profiles and also all your job applications',
              textAlign: TextAlign.center,
              style: $style.text.textSBold12.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
          ),
          Image.asset(
            "assets/gif/search_not_found.gif",
            height: 176,
            width: 150,
          ),
          Gap($style.insets.sm),
          Text(
            'No Applied Jobs',
            textScaler: const TextScaler.linear(1),
            style: $style.text.textBold18.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
          const Gap(30)
        ],
      ),
    );
  }
}
