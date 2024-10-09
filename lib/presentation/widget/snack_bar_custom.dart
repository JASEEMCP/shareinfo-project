import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/root_widget.dart';

SnackBar showSnackBar(String content) {
  return SnackBar(
    dismissDirection: DismissDirection.down,
    duration: $style.times.slow,
    elevation: 0,
    content: Center(
      child: Text(
        content,
        textScaler: const TextScaler.linear(1),
        textAlign: TextAlign.center,
        style: $style.text.textSBold14,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 144, 143, 145),
    behavior: SnackBarBehavior.floating,
  );
}
