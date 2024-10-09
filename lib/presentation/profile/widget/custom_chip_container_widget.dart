import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: context.theme.shareinfoBlue,
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: $style.insets.sm, vertical: $style.insets.xxs),
      child: Text(
        label,
        style: $style.text.textBold10.copyWith(
          color: context.theme.shareinfoBlue,
        ),
      ),
    );
  }
}
