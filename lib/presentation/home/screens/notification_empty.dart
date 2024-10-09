import 'package:shareinfo/presentation/core/common_lib.dart';

class NoNotification extends StatelessWidget {
  const NoNotification({
    super.key,
    this.padding,
  });

  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: kToolbarHeight),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/alarm-bell.png",
              height: 100,
            ),
            Gap($style.insets.xxl),
            Text(
              'There is No New Notifications for Now !',
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold16.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
            Text(
              'Have a Look Later',
              textScaler: const TextScaler.linear(1),
              textAlign: TextAlign.center,
              style: $style.text.textBold14.copyWith(
                color: context.theme.statusBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
