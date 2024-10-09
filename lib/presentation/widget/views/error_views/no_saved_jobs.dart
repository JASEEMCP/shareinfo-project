import 'package:shareinfo/presentation/core/common_lib.dart';

class NoSavedJob extends StatelessWidget {
  const NoSavedJob({
    super.key,
    required this.onRefresh,
    this.padding,
  });
  final Function onRefresh;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: kToolbarHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/gif/search_not_found.gif",
            height: 176,
            width: 200,
          ),
          Gap($style.insets.sm),
          Text(
            'No Saved Jobs',
            textScaler: const TextScaler.linear(1),
            style: $style.text.textBold20.copyWith(
              color: context.theme.imiotDarkPurple,
            ),
          ),
          TextButton(
            onPressed: () {
              onRefresh();
            },
            child: Text(
              'Explore More Job !',
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
