import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.label,
    required this.onTap,
    required this.icon,
  });
  final Color backgroundColor;
  final Color iconColor;
  final String label;
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(70),
              onTap: () {
                onTap();
              },
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
        ),
        Gap($style.insets.sm),
        Text(
          label,
          textScaler: const TextScaler.linear(1),
          style: $style.text.textBold12.copyWith(
            color: iconColor,
          ),
        )
      ],
    );
  }
}
