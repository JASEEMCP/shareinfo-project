import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.hintText,
    required this.onPressed,
    this.disableSuffix = false,
    this.autoFocus = false,
    this.onChanged,
    this.controller,
    this.icon,
  });

  final String hintText;
  final Function onPressed;
  final bool? disableSuffix;
  final bool? autoFocus;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return TextField(
      controller: controller,
      autofocus: autoFocus!,
      style: $style.text.textSBold12.copyWith(
        overflow: TextOverflow.ellipsis,
        color: context.theme.shareinfoGrey,
      ),
      clipBehavior: Clip.none,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          size: inset.xm,
        ),
        prefixIconColor: context.theme.shareinfoGrey,
        suffixIconColor: context.theme.shareinfoLightBlue,
        isDense: true,
        fillColor: const Color.fromARGB(173, 240, 237, 237),
        hintText: hintText,
        hintStyle: $style.text.textSBold12.copyWith(
          overflow: TextOverflow.ellipsis,
          color: context.theme.shareinfoGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(inset.xs),
          borderSide: BorderSide.none,
        ),

        //drawer button
        suffixIcon: !disableSuffix!
            ? IconButton(
                onPressed: () {
                  onPressed();
                },
                icon: Icon(
                  icon ?? Icons.sort,
                  size: inset.xm,
                  color: Colors.grey.shade600,
                ),
              )
            : null,
      ),
    );
  }
}
