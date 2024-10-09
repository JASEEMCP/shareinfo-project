import 'package:shareinfo/presentation/core/common_lib.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpInput(
    this.controller,
    this.autoFocus, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return SizedBox(
      height: kTextTabBarHeight,
      width: kBottomNavigationBarHeight,
      child: TextFormField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        style: $style.text.textBold16.copyWith(
          color: context.theme.shareinfoGrey,
        ),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.theme.shareinfoWhite,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(inset.xs),
            borderSide: BorderSide(
              color: context.theme.shareinfoGreyLite,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(inset.xs),
            borderSide: BorderSide(
              color: context.theme.shareinfoGreyLite,
            ),
          ),
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        onFieldSubmitted: (value) {
          FocusScope.of(context).previousFocus();
        },
      ),
    );
  }
}
