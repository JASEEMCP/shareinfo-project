import 'package:flutter/services.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class MultiLineTextField extends StatelessWidget {
  const MultiLineTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
    this.validate = false,
    this.controller,
    this.maxLine,
    this.enable,
  });
  final String label;
  final String hintText;
  final Function(String?)? validator;
  final bool? validate;
  final TextEditingController? controller;
  final int? maxLine;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    final style = $style.text;
    final insets = $style.insets;
    return Padding(
      padding: EdgeInsets.only(
        bottom: insets.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: style.textBold14.copyWith(
              color: context.theme.imiotDarkPurple,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(insets.xxs),
          TextFormField(
            controller: controller,
            validator: validate!
                ? (value) {
                    //check validator is not null
                    if (validator != null) {
                      return validator!(value);
                    } else {
                      if (value != null && value.trim().isEmpty) {
                        return 'This field is Required';
                      }
                    }
                    return null;
                  }
                : null,
            scrollPhysics: const BouncingScrollPhysics(),
            inputFormatters: [LengthLimitingTextInputFormatter(499)],
            minLines: maxLine ?? 6,
            maxLines: maxLine ?? 15,
            enabled: enable,
            textCapitalization: TextCapitalization.sentences,
            style: style.textSBold12.copyWith(
              color: context.theme.shareinfoGrey,
            ),
            decoration: InputDecoration(
              errorStyle: style.textBold10.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              hintMaxLines: 4,
              hintText: hintText,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.all(insets.md),
              fillColor: context.theme.shareinfoWhite,
              hintStyle: style.textSBold10.copyWith(
                color: context.theme.shareinfoGrey,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: context.theme.shareinfoRed,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: context.theme.shareinfoGreyLite,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: context.theme.shareinfoGreyLite,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: context.theme.shareinfoGreyLite,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: context.theme.shareinfoGreyLite,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
