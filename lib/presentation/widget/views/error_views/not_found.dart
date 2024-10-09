import 'package:shareinfo/presentation/core/common_lib.dart';

class NotFound extends StatelessWidget {
  const NotFound({
    super.key,
    required this.onRefresh,
    this.padding,
    this.errorText,
  });
  final Function onRefresh;
  final EdgeInsets? padding;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: kToolbarHeight),
      child: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/gif/not_found.gif",
            height: 176,
            width: 200,
          ),
          Gap($style.insets.sm),
          Center(
            child: Text(
              errorText ?? 'Not Found',
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold20.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              onRefresh();
            },
            child: Text(
              'Tap to retry',
              textScaler: const TextScaler.linear(1),
              textAlign: TextAlign.center,
              style: $style.text.textBold12.copyWith(
                color: context.theme.shareinfoBlue,
              ),
            ),
          ),
          const Gap(30)
        ],
      ),
    );
  }
}
