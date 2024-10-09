import 'package:flutter/services.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class AuthTextFieldWidget extends StatelessWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.hasError = false,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatter,
    this.onSuffixTap,
    this.onTap,
    this.autoFillHints,
  });
  final String hintText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final bool? hasError;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final Function? onSuffixTap;
  final Function? onTap;
  final Iterable<String>? autoFillHints;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        maxLines: 1,
        minLines: 1,
        style: $style.text.textBold12.copyWith(
          color: context.theme.imiotDarkPurple,
          letterSpacing: 1,
        ),
        controller: controller,
        validator: (value) => validator == null ? null : validator!(value),
        obscureText: obscureText!,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        onTap: onTap != null
            ? () {
                onTap!();
              }
            : null,
        expands: false,
        autofillHints: autoFillHints,
        decoration: InputDecoration(
          errorMaxLines: 3,
          filled: true,
          isDense: true,

          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    onSuffixTap!();
                  },
                  icon:
                      obscureText! ? suffixIcon! : const Icon(Icons.visibility),
                )
              : null,
          suffixIconColor: context.theme.shareinfoGrey,
          // fillColor: const Color.fromARGB(192, 250, 249, 249),
          fillColor: const Color.fromARGB(255, 243, 242, 242),
          prefixIcon: prefixIcon,
          hintText: hintText,
          errorStyle: $style.text.textBold12,
          hintStyle: $style.text.textBold12.copyWith(
            color: context.theme.imiotDeepPurple.withOpacity(0.3),
          ),
          prefixIconColor: context.theme.shareinfoGrey,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.shareinfoGreyLite),
            borderRadius: BorderRadius.circular(13),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.shareinfoGreyLite),
            borderRadius: BorderRadius.circular(13),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.shareinfoGreyLite),
            borderRadius: BorderRadius.circular(13),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.shareinfoGreyLite),
            borderRadius: BorderRadius.circular(13),
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
