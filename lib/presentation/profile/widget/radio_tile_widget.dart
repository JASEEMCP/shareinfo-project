import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class CustomRadioTileWidget extends StatelessWidget {
  const CustomRadioTileWidget({
    super.key,
    required this.title,
    this.onChanged,
    this.value,
    this.affinity,
    this.padding,
  });
  final String title;
  final String? value;
  final ListTileControlAffinity? affinity;
  final Function(String?)? onChanged;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return RadioListTile(
      activeColor: context.theme.imiotDarkPurple,
      value: value ?? 'English',
      contentPadding: padding ??
          EdgeInsets.only(
            left: inset.md,
            right: inset.md,
          ),
      controlAffinity: affinity ?? ListTileControlAffinity.trailing,
      title: Text(
        title,
        style: onChanged != null
            ? $style.text.textSBold14.copyWith(
                color: context.theme.imiotDarkPurple,
              )
            : $style.text.textSBold14.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
      ),
      groupValue: title,
      onChanged: onChanged,
    );
  }
}
