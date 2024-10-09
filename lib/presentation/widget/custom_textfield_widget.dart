import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/core/string_util.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.label,
    required this.hintText,
    this.controller,
    this.readOnly,
    this.suffix,
    this.prefix,
    this.validate = false,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.enabled,
    this.maxLine,
    this.obscure = false,
    this.inputFormatter,
    this.bottomPadding,
    this.labelTxtColor,
  });
  final String hintText;
  final String? label;
  final TextEditingController? controller;
  final bool? readOnly;
  final Widget? suffix;
  final Widget? prefix;
  final bool? validate;
  final Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? enabled;
  final int? maxLine;
  final bool? obscure;
  final double? bottomPadding;
  final List<TextInputFormatter>? inputFormatter;
  final Color? labelTxtColor;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding ?? inset.lg,
      ),
      child: SizedBox(
        //width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label != null
                ? Text(
                    label!,
                    style: style.textBold14.copyWith(
                      color: labelTxtColor ?? context.theme.imiotDarkPurple,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : const SizedBox.shrink(),
            Gap(inset.xxs),
            TextFormField(
              inputFormatters: inputFormatter,
              textCapitalization: TextCapitalization.sentences,
              obscureText: obscure!,
              enabled: enabled,
              keyboardType: keyboardType,
              minLines: maxLine ?? 1,
              maxLines: maxLine ?? 1,
              onChanged: (value) {
                onChanged != null ? onChanged!(value) : null;
              },
              style: style.textSBold12.copyWith(
                color: context.theme.imiotDarkPurple,
                overflow: TextOverflow.ellipsis,
              ),
              controller: controller,
              readOnly: readOnly ?? false,
              validator: validate!
                  ? (value) {
                      if (validator != null) {
                        return validator!(value);
                      } else {
                        if (isEmptyForm(value)) {
                          return 'This field is Required';
                        }
                      }
                      return null;
                    }
                  : null,
              decoration: InputDecoration(
                errorMaxLines: 3,
                errorStyle: style.textBold10,
                prefixIcon: prefix,
                suffixIcon: suffix,
                hintText: hintText,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: inset.lg,
                  vertical: inset.md,
                ),
                fillColor: context.theme.shareinfoWhite,
                hintStyle: style.textSBold10.copyWith(
                  color: context.theme.shareinfoGrey,
                ),
                disabledBorder: _buildInputBorder(context),
                focusedErrorBorder: _buildInputBorder(context),
                focusedBorder: _buildInputBorder(context),
                errorBorder: _buildInputBorder(context),
                enabledBorder: _buildInputBorder(context),
                border: _buildInputBorder(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _buildInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: context.theme.shareinfoGreyLite,
      ),
    );
  }
}
