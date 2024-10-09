import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';

enum TextFieldWidth {
  medium,
  large,
}

extension TextFieldSize on TextFieldWidth {
  int get percentage {
    switch (this) {
      case TextFieldWidth.medium:
        return 40;
      case TextFieldWidth.large:
        return 100;
      default:
        return 100;
    }
  }
}

class CustomDropDownTextFieldWidget extends StatelessWidget {
  const CustomDropDownTextFieldWidget({
    super.key,
    this.label,
    required this.hintText,
    required this.width,
    this.subTitle,
    required this.dropDownItem,
    this.onSelect,
    this.disableField = false,
    this.validator,
    this.initialValue,
  });
  final String hintText;
  final String? label;
  final TextFieldWidth width;
  final String? subTitle;
  final List<String> dropDownItem;
  final Function(String?)? onSelect;
  final bool? disableField;
  final Function(String?)? validator;

  ///initial value must pass if dropDownItem is define
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;

    return Padding(
      padding: EdgeInsets.only(
        bottom: inset.lg,
      ),
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label != null
                ? Text(
                    label!,
                    style: style.textBold14.copyWith(
                      color: context.theme.imiotDarkPurple,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : const SizedBox.shrink(),
            Gap(inset.xxs),
            DropdownButtonFormField2(
              validator: validator != null
                  ? (value) => validator!(value as String?)
                  : null,
              buttonStyleData: ButtonStyleData(
                width: width.percentage * context.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 30 * context.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              style: style.textSBold12.copyWith(
                color: context.theme.imiotDarkPurple,
                fontFamily: 'Nunito',
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                  color: disableField!
                      ? context.theme.shareinfoTextDark
                      : context.theme.imiotDarkPurple,
                ),
              ),
              onChanged: (value) {
                onSelect!(value as String);
              },
              alignment: Alignment.centerLeft,
              hint: Text(
                hintText,
                style: style.textSBold10.copyWith(
                  color: context.theme.shareinfoTextDark,
                  fontFamily: 'Nunito',
                ),
              ),
              isExpanded: true,
              value: initialValue,
              items: [
                for (int index = 0; index < dropDownItem.length; index++)
                  DropdownMenuItem(
                    value: dropDownItem[index],
                    child: Text(
                      dropDownItem[index],
                    ),
                  ),
              ],
              decoration: buildInputDecoration(context, null),
            ),
            Gap(inset.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                subTitle != null
                    ? Text(
                        subTitle!,
                        style: style.textBold10.copyWith(
                          color: context.theme.imiotDarkPurple,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DropDownDatePickerWidget extends StatelessWidget {
  const DropDownDatePickerWidget({
    super.key,
    this.label,
    required this.hintText,
    required this.width,
    required this.onTap,
    this.valueTxt,
    this.disableField = false,
    this.validator,
  });
  final String hintText;
  final String? label;
  final TextFieldWidth width;
  final Function onTap;
  final bool? disableField;
  final String? valueTxt;
  final Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
                style: !disableField!
                    ? style.textBold14.copyWith(
                        color: context.theme.imiotDarkPurple,
                        overflow: TextOverflow.ellipsis,
                      )
                    : style.textBold14.copyWith(
                        color: context.theme.shareinfoTextDark,
                        overflow: TextOverflow.ellipsis,
                      ),
              )
            : const SizedBox.shrink(),
        Gap(inset.xxs),
        GestureDetector(
          onTap: () {
            //Disable field
            disableField! ? () {} : onTap();
          },
          child: DropdownButtonFormField2(
            validator: (value) {
              return validator == null ? null : validator!(value);
            },
            buttonStyleData: ButtonStyleData(
              width: width.percentage * context.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            style: style.textSBold12.copyWith(
              color: context.theme.imiotDarkPurple,
              fontFamily: 'Nunito',
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: disableField!
                    ? context.theme.shareinfoTextDark
                    : context.theme.imiotDarkPurple,
              ),
            ),
            alignment: Alignment.centerLeft,
            isExpanded: true,
            value: 'DateValue',
            items: [
              //This is an dropdown menu
              DropdownMenuItem(
                value: 'DateValue',
                child: Text(
                  ///Return different text corresponding
                  valueTxt ?? hintText,
                  style: valueTxt == null
                      ? style.textBold10.copyWith(
                          color: context.theme.shareinfoTextDark,
                          fontFamily: 'Nunito',
                        )
                      : style.textBold12.copyWith(
                          color: context.theme.imiotDarkPurple,
                          fontFamily: 'Nunito',
                        ),
                ),
              ),
            ],
            decoration: buildInputDecoration(context, hintText),
          ),
        ),
      ],
    );
  }
}

///Custom input decoration
InputDecoration buildInputDecoration(BuildContext context, String? hintText) {
  final style = $style.text;
  final inset = $style.insets;
  return InputDecoration(
    errorStyle: style.textBold10.copyWith(
      overflow: TextOverflow.ellipsis,
    ),
    filled: true,
    hintText: hintText,
    hintStyle: style.textSBold10.copyWith(
      color: context.theme.shareinfoTextDark,
      fontFamily: 'Nunito',
    ),
    contentPadding: EdgeInsets.only(
      left: inset.lg,
      right: inset.sm,
    ),
    fillColor: context.theme.shareinfoWhite,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: context.theme.shareinfoGreyLite,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: context.theme.shareinfoGreyLite,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: context.theme.shareinfoRed,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: context.theme.shareinfoGreyLite,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: context.theme.shareinfoGreyLite,
      ),
    ),
  );
}

class StatusCheckBoxWidget extends StatelessWidget {
  const StatusCheckBoxWidget({
    super.key,
    required this.statusVisibilityNotifier,
    required this.statusText,
    required this.onChanged,
  });

  final ValueNotifier<bool> statusVisibilityNotifier;
  final String statusText;
  final Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: statusVisibilityNotifier,
      builder: (context, enabled, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              side: BorderSide(
                color: context.theme.shareinfoGrey,
              ),
              activeColor: context.theme.shareinfoLightBlue,
              onChanged: (val) {
                onChanged(val);
              },
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              value: enabled,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                statusText,
                softWrap: true,
                style: $style.text.textBold10.copyWith(
                  color: enabled ? context.theme.imiotDarkPurple : Colors.grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
