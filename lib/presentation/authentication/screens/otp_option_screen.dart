import 'package:shareinfo/core/platform_info.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenForgotPasswordOption extends StatelessWidget {
  ScreenForgotPasswordOption({super.key});
  final ValueNotifier<int> selectTypeNotifier = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    selectTypeNotifier.value = 1;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.theme.shareinfoWhite,
      appBar: buildCustomAppBar(
        context,
        title: "Verify E-Mail Account",
        enableSuffixIcon: false,
        onPop: () {
          context.go(ScreenPath.login);
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Gap(inset.md),
              if (PlatformInfo.isDesktopOrWeb)
                Semantics(
                  readOnly: true,
                  image: true,
                  label: 'Animated image',
                  child: Image.asset(
                    'assets/icons/select.png',
                    height: 150,
                    width: 300,
                  ),
                ),
              if (PlatformInfo.isMobile)
                Semantics(
                  readOnly: true,
                  image: true,
                  label: 'Animated image',
                  child: Image.asset(
                    'assets/gif/forgot_password_gif.gif',
                    height: 270,
                  ),
                ),
              Gap(inset.md),
              SizedBox(
                width: 300,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Select which contact details should we use to reset your password",
                        style: $style.text.textSBold14.copyWith(
                          color: context.theme.shareinfoGrey,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(inset.md),
              Semantics(
                button: true,
                readOnly: true,
                label: 'Choose otp verification option',
                child: OtpReceivingTypeWidget(
                  id: 1,
                  notifier: selectTypeNotifier,
                  imagePath: ImagePaths.emailIcon,
                  otpType: 'Verify via E-mail',
                  receiverData: 'abc@gmail.com',
                ),
              ),
              Gap(inset.md),
              Semantics(
                button: true,
                label: 'Navigate into next page',
                child: CustomElevatedButton(
                  buttonName: 'Continue',
                  width: ElevatedButtonWidth.custom,
                  onPressed: () {
                    if (selectTypeNotifier.value == 1) {
                      context.go(ScreenPath.verifyContact());
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(showSnackBar('Select an option'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpReceivingTypeWidget extends StatelessWidget {
  const OtpReceivingTypeWidget({
    super.key,
    required this.imagePath,
    required this.otpType,
    required this.receiverData,
    required this.id,
    required this.notifier,
  });
  final String imagePath;
  final String otpType;
  final String receiverData;
  final int id;
  final ValueNotifier<int> notifier;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return GestureDetector(
      onTap: () {
        if (notifier.value == id) {
          notifier.value = -1;
          return;
        }
        notifier.value = id;
      },
      child: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, typeIndex, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.only(bottom: inset.sm),
            //padding: EdgeInsets.all(inset.xs + 1),
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: context.theme.shareinfoGrey,
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: context.theme.shareinfoGreyLite,
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1.5,
                color: id == typeIndex
                    ? context.theme.shareinfoBlue
                    : context.theme.shareinfoGreyLite,
              ),
              color: context.theme.shareinfoWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(inset.sm),
                Container(
                  padding: EdgeInsets.all(inset.sm),
                  margin: EdgeInsets.all(inset.xs),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.statusBlue,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      imagePath,
                      height: 25,
                    ),
                  ),
                ),
                Gap(inset.sm),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: otpType,
                        style: $style.text.textBold12.copyWith(
                          color: context.theme.shareinfoGrey,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
