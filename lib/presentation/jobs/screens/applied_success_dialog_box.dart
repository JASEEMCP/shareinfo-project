import 'dart:ui';

import 'package:shareinfo/presentation/main_screen/main_screen.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

Future<Object?> buildAppliedSuccessDialogBox(BuildContext context) {
  return showGeneralDialog(
    context: context,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    barrierLabel: 'Job Success',
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: PopScope(
          canPop: false,
          child: AlertDialog(
            surfaceTintColor: context.theme.shareinfoWhite,
            title: Image.asset("assets/gif/applied_success.gif"),
            actionsAlignment: MainAxisAlignment.center,
            scrollable: true,
            actionsOverflowButtonSpacing: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            titlePadding: const EdgeInsets.symmetric(horizontal: 25),
            actions: [
              Center(
                child: Text(
                  'Congratulations!',
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textBold20.copyWith(
                    color: context.theme.shareinfoMidBlue,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Your application has been successfully submitted. You can track the progress of your application through the applications menu.',
                  textAlign: TextAlign.center,
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
              ),
              CustomElevatedButton(
                buttonName: 'Go to My Applications',
                width: ElevatedButtonWidth.large,
                onPressed: () {
                  tabChangeNotifier.value = 1;
                  context.pop();
                  context.go(ScreenPath.application);
                },
              ),
              CustomElevatedButton(
                buttonName: 'Cancel',
                backgroundColor: context.theme.lightBlue,
                buttonTextColor: context.theme.imiotDarkPurple,
                width: ElevatedButtonWidth.large,
                onPressed: () {
                  context.pop();
                },
              )
            ],
          ),
        ),
      );
    },
  );
}
