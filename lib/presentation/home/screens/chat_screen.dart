import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    this.onSubmit,
    this.enableBottomText = false,
    this.background,
  });
  final Function? onSubmit;
  final bool? enableBottomText;
  final Color? background;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background ?? const Color(0xffECEDFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(kTextTabBarHeight),
          Center(
            child: SizedBox(
              height: 280,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/gif/feature_unlock.gif",
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      !enableBottomText!
                          ? "assets/images/connections.png"
                          : "assets/images/drives.png",
                      height: enableBottomText! ? 40 : 45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap($style.insets.sm),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $style.insets.md),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Feature Locked !\n',
                    style: $style.text.textBold26.copyWith(
                      color: context.theme.imiotDarkPurple,
                      fontFamily: 'Nunito',
                    ),
                  ),

                  ///change button name depending on its view
                  TextSpan(
                    text: '''This Feature is Not Available For Now!''',
                    style: $style.text.textSBold10.copyWith(
                      color: context.theme.imiotDarkPurple,
                      fontFamily: 'Nunito',
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Visibility(
            visible: enableBottomText!,
            child: Column(
              children: [
                Text(
                  'Complete Your Student Account Verification\nto Access this Feature !',
                  textAlign: TextAlign.center,
                  style: $style.text.textSBold10.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
                Gap($style.insets.sm)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: CustomElevatedButton(
          buttonName: 'Explore Home',
          width: ElevatedButtonWidth.large,
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
