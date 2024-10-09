import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/root_widget.dart';

EdgeInsets customPaddingBottom() {
  final inset = $style.insets;
  return EdgeInsets.only(
    left: inset.lg,
    right: inset.lg,
    bottom: inset.md,
  );
}

EdgeInsets customPaddingTop() {
  final inset = $style.insets;
  return EdgeInsets.only(
    left: inset.lg,
    right: inset.lg,
    top: inset.sm,
  );
}
