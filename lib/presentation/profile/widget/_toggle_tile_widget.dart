import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class ToggleListTileWidget extends StatelessWidget {
  const ToggleListTileWidget({
    super.key,
    required this.title,
    required this.onPressed,
    required this.value,
  });
  final String title;
  final bool value;
  final Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Container(
      padding: EdgeInsets.only(
        left: inset.md,
        right: inset.md,
      ),
      constraints: const BoxConstraints(minHeight: 45),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: "General Notifications".length.toDouble() * 10.5,
            child: Text(
              title,
              style: $style.text.textSBold12.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              activeColor: context.theme.shareinfoWhite,
              activeTrackColor: context.theme.imiotDarkPurple,
              trackOutlineColor:
                  WidgetStatePropertyAll(context.theme.imiotDarkPurple),
              value: value,
              onChanged: (v) {
                onPressed(v);
              },
            ),
          )
        ],
      ),
    );
  }
}
