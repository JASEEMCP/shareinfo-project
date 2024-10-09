import 'package:shareinfo/presentation/core/common_lib.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          activeColor: context.theme.shareinfoBlue,
          onChanged: (newVal) {
            setState(
              () {
                isChecked = newVal!;
                settingsLogic.rememberMe.value = newVal;
              },
            );
          },
        ),
        Text('Remember me',
            style: $style.text.textBold14.copyWith(
              color: context.theme.shareinfoGrey,
            )),
      ],
    );
  }
}
