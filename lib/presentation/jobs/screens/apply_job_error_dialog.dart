import 'dart:ui';
import 'package:shareinfo/application/job/apply_job_cubit/apply_job_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';

Future<Object?> buildAppliedErrorDialogBox(BuildContext context) {
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
            title: Image.asset("assets/gif/applied_error.gif"),
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
                  'Something went wrong!',
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.center,
                  style: $style.text.textBold20.copyWith(
                    color: context.theme.shareinfoMidBlue,
                  ),
                ),
              ),
              CustomElevatedButton(
                buttonName: 'Try Again',
                width: ElevatedButtonWidth.large,
                onPressed: () {
                  context.pop();
                  context.read<ApplyJobCubit>().applyJob(applyJobModel);
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
