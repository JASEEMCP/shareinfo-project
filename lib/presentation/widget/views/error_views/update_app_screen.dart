import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/views/padding.dart';

class UpdateAppScreen extends StatelessWidget {
  const UpdateAppScreen({
    super.key,
    this.padding,
  });
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Gap(5 * kTextTabBarHeight),
          Image.asset(
            "assets/marketing/logo-shareinfo.png",
            height: 150,
            width: 160,
          ),
          Gap($style.insets.sm),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $style.insets.md),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You are Using older version of\n',
                    style: $style.text.textBold16.copyWith(
                      color: context.theme.imiotDarkPurple,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  TextSpan(
                    text: 'ShareInfo ',
                    style: $style.text.textBold16.copyWith(
                      color: context.theme.shareinfoOrange,
                      fontFamily: 'Nunito',
                    ),
                  ),

                  ///change button name depending on its view
                  TextSpan(
                    text:
                        '''Application\nUpdate to Latest one to try out our New features!''',
                    style: $style.text.textBold16.copyWith(
                      color: context.theme.imiotDarkPurple,
                      fontFamily: 'Nunito',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: CustomElevatedButton(
          buttonName: 'Update Now',
          width: ElevatedButtonWidth.large,
          onPressed: () async {
            await openPlayStore();
            SystemNavigator.pop();
          },
        ),
      ),
    );
  }
}
