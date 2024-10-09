import 'package:shareinfo/presentation/core/common_lib.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    super.key,
    required this.leadingIcon,
    required this.text,
    this.isColorRed = false,
    this.onPressed,
    this.suffix,
  });

  final Widget leadingIcon;
  final String text;
  final bool isColorRed;
  final Widget? suffix;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ListTile(
            horizontalTitleGap: inset.xs,
            dense: true,
            onTap: () {
              onPressed != null ? onPressed!() : () {};
            },
            contentPadding: EdgeInsets.only(
              left: inset.md,
              right: inset.md,
            ),
            leading: leadingIcon,
            iconColor: context.theme.imiotDarkPurple,
            title: Text(
              text,
              style: $style.text.textSBold14.copyWith(
                color: isColorRed
                    ? context.theme.shareinfoRed
                    : context.theme.shareinfoBlack,
              ),
            ),
            trailing: suffix == null
                ? Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: inset.sm + 1,
                    color: context.theme.imiotDarkPurple,
                  )
                : suffix!,
          ),
        ),
      ],
    );
  }
}
