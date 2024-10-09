import 'package:shareinfo/presentation/core/common_lib.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.isVisible = false,
    this.iconColor,
  });
  final IconData icon;
  final Function? onPressed;
  final bool? isVisible;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          iconSize: 20,
          alignment: Alignment.center,
          onPressed: () {
            onPressed == null ? () {} : onPressed!();
          },
          icon: Container(
            height: $style.insets.xxl,
            width: $style.insets.xxl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  color: context.theme.shareinfoGreyLite,
                ),
              ),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 1,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: iconColor ?? context.theme.shareinfoGrey,
            ),
          ),
        ),
        Visibility(
          visible: isVisible!,
          child: Positioned(
            right: 8,
            top: 9,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.shareinfoOrange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
