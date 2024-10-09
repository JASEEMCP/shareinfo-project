import 'package:shareinfo/presentation/core/common_lib.dart';

class NetWorkError extends StatelessWidget {
  const NetWorkError({
    super.key,
    this.onRefresh,
    this.padding,
  });
  final Function? onRefresh;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: kToolbarHeight),
      child: ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Image.asset(
            "assets/gif/network_error.gif",
            height: 176,
            width: 200,
          ),
          Gap($style.insets.sm),
          Center(
            child: Text(
              'Something Went Wrong',
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold20.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: $style.insets.md),
            child: Text(
              'May Refreshing this page or Restarting Application can Fix this issue !',
              textScaler: const TextScaler.linear(1),
              textAlign: TextAlign.center,
              style: $style.text.textBold12.copyWith(
                color: context.theme.shareinfoOrange,
              ),
            ),
          ),
          onRefresh != null
              ? TextButton(
                  onPressed: () {
                    onRefresh!();
                  },
                  child: Text(
                    'Try Again',
                    textScaler: const TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: $style.text.textBold12.copyWith(
                      color: context.theme.shareinfoBlue,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
