import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/style/theme.dart';

extension ContextData on BuildContext {
  Size get mq => MediaQuery.of(this).size;

  double get h => mq.height / 100;
  double get w => mq.width / 100;

  AppTheme get theme => AppTheme.fromType(ThemeType.shareInfoLight);

  // TextTheme get txtTheme => Theme.of(this).textTheme;
  // ColorScheme get themeData => Theme.of(this).colorScheme;
  void pushR(Widget? page) {
    if (page == null) return;
    Navigator.push(this, MaterialPageRoute(builder: (ctx) => page));
  }

  void showCustomSnackbar() {
    HapticFeedback.mediumImpact();
    Flushbar(
      backgroundColor: const Color.fromARGB(255, 207, 110, 97),
      animationDuration: const Duration(seconds: 1),
      isDismissible: false,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      margin: const EdgeInsets.all(10),
      message: 'Provide media file proof for verification',
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }

  void showUploadFailed() {
    HapticFeedback.mediumImpact();
    Flushbar(
      backgroundColor: const Color.fromARGB(255, 207, 110, 97),
      animationDuration: const Duration(seconds: 1),
      isDismissible: false,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      margin: const EdgeInsets.all(10),
      message: 'Failed to upload media',
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }

  void showCustomSnackbarAtTop() {
    HapticFeedback.mediumImpact();
    Flushbar(
      backgroundColor: const Color.fromARGB(255, 107, 192, 110),
      animationDuration: const Duration(seconds: 1),
      isDismissible: false,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      margin: const EdgeInsets.all(10),
      message: 'Profile saved successfully',
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }

  void showSizeExceedWarning() {
    HapticFeedback.mediumImpact();
    Flushbar(
      backgroundColor: const Color.fromARGB(255, 207, 110, 97),
      animationDuration: const Duration(seconds: 1),
      isDismissible: false,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      margin: const EdgeInsets.all(10),
      message: 'Document size cannot exceed 3 MB',
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }

  void showUnsupportedMedia() {
    HapticFeedback.mediumImpact();
    Flushbar(
      backgroundColor: const Color.fromARGB(255, 207, 110, 97),
      animationDuration: const Duration(seconds: 1),
      isDismissible: false,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      margin: const EdgeInsets.all(10),
      message: 'Unsupported media format. Support only(eg:pdf/PDF)',
      flushbarPosition: FlushbarPosition.TOP,
    ).show(this);
  }

  void deleteWarningMessage(Function onSubmit) async {
    await showCustomAlertBox(
      this,
      content: 'are you sure want to delete this section !',
      onSubmit: () async {
        await onSubmit();
        mounted ? pop() : null;
      },
    );
  }

  void logoutWarningAlert(Function onSubmit) async {
    await showCustomAlertBox(
      this,
      content: 'are you sure want to logout from this session !',
      onSubmit: () async {
        await onSubmit();
        mounted ? pop() : null;
      },
    );
  }

  void get popR => Navigator.pop(this);
}
