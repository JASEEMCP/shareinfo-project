import 'dart:ui';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/settings/delete_account_screen.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';

Future<Object?> showDeleteAccountDialog(BuildContext context) {
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
            actionsAlignment: MainAxisAlignment.center,
            scrollable: true,
            actionsOverflowButtonSpacing: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            ),
            title: Center(
              child: Text(
                'Are You Sure Want to Delete ShareInfo account!',
                textScaler: const TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: $style.text.textSBold18.copyWith(
                  color: context.theme.shareinfoMidBlue,
                ),
              ),
            ),
            titlePadding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            actions: [
              Center(
                child: Text(
                  'Your Data will be Delete Instantly, and our support team will connect you shortly for the feedback ',
                  textAlign: TextAlign.center,
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
              ),
              BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
                listener: (context, state) {
                  if (state.isSubmitted) {
                    ///Navigating into login screen user is delete their account
                    return context.go(ScreenPath.login);
                  }
                  // Show Error message
                  if (state.isError) {
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      showSnackBar(
                        state.maybeWhen(
                          orElse: () => 'Something went Wrong',
                          submissionError: (e) => e.errorDescription,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    buttonName: 'Delete Now',
                    isLoading: state.isSubmitting,
                    width: ElevatedButtonWidth.large,
                    backgroundColor: context.theme.statusRed,
                    buttonTextColor: context.theme.statusRedAccentDark,
                    onPressed: () {
                      context
                          .read<DeleteAccountCubit>()
                          .deleteAccount(deleteModel);
                    },
                  );
                },
              ),
              CustomElevatedButton(
                buttonName: 'Keep Using',
                backgroundColor: context.theme.statusGreen,
                buttonTextColor: context.theme.statusGreenAccentDark,
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
