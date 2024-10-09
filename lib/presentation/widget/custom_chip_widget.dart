import 'package:shareinfo/presentation/core/common_lib.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key,
    required this.chipText,
    this.bordercolor = const Color.fromARGB(160, 67, 67, 67),
    this.backgroundColor,
    this.textColor = Colors.grey,
  });
  final String chipText;
  final Color? bordercolor;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 8 * chipText.length.toDouble(),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: backgroundColor ?? context.theme.shareinfoWhite,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: bordercolor as Color,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Text(
        chipText,
        textAlign: TextAlign.center,
        textScaler: const TextScaler.linear(1),
        maxLines: 1,
        style: $style.text.textBold10.copyWith(
          color: textColor,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
