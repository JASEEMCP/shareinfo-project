import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';

class ScreenFeedBackSuccess extends StatelessWidget {
  const ScreenFeedBackSuccess({super.key, required this.eventId});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: inset.md),
          width: 600,
          child: ListView(
            children: [
              const Gap(100),
              Image.asset(
                'assets/gif/feedback_success.gif',
                height: 200,
                width: 250,
              ),
              Text(
                'Thank You',
                textScaler: const TextScaler.linear(1),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: $style.text.textBold20.copyWith(
                  color: context.theme.shareinfoBlue,
                ),
              ),
              Text(
                'For Your Participation',
                textAlign: TextAlign.center,
                textScaler: const TextScaler.linear(1),
                maxLines: 1,
                style: $style.text.textSBold18.copyWith(
                  color: context.theme.shareinfoTextDark,
                ),
              ),
              Gap(inset.sm),
              Text(
                'We\'re happy to Hear from You!',
                textAlign: TextAlign.center,
                textScaler: const TextScaler.linear(1),
                maxLines: 1,
                style: $style.text.textSBold14.copyWith(
                  color: context.theme.shareinfoTextDark,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: CustomElevatedButton(
          buttonName: 'Explore Happenings',
          width: ElevatedButtonWidth.large,
          onPressed: () {
            context.go('/happenings/happening_detail/$eventId');
          },
        ),
      ),
    );
  }
}
