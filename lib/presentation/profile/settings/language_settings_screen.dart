import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/profile/widget/radio_tile_widget.dart';

class ScreenLanguageSettings extends StatelessWidget {
  ScreenLanguageSettings({super.key});

  final List suggestedList = ['English'];
  final List languageList = [
    'Malayalam',
    'Tamil',
    'Telugu',
    'Kannada',
    'Marathi',
    'Urdu',
    'Bengali'
  ];
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: buildCustomAppBar(context,
          title: "Language", enableSuffixIcon: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: inset.md,
                      right: inset.md,
                    ),
                    child: Text(
                      'Suggested',
                      style: $style.text.textSBold16.copyWith(
                        color: context.theme.imiotDarkPurple,
                      ),
                    ),
                  ),
                  Gap(inset.sm),
                  for (String title in suggestedList)
                    CustomRadioTileWidget(
                      title: title,
                      onChanged: (v) {},
                    ),
                  Divider(
                    color: context.theme.shareinfoGreyLite,
                    indent: inset.md,
                    endIndent: inset.md,
                  ),
                  Gap(inset.md),
                  Padding(
                    padding: EdgeInsets.only(
                      left: inset.md,
                      right: inset.md,
                    ),
                    child: Text(
                      'Language',
                      style: $style.text.textSBold16.copyWith(
                        color: context.theme.imiotDarkPurple,
                      ),
                    ),
                  ),
                  Gap(inset.sm),
                  for (String title in languageList)
                    CustomRadioTileWidget(title: title),
                  Divider(
                    color: context.theme.shareinfoGreyLite,
                    indent: inset.md,
                    endIndent: inset.md,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: inset.md,
                      right: inset.md,
                    ),
                    child: Text(
                      'We’re Working to Enable Local Languages Soon !',
                      textAlign: TextAlign.center,
                      style: $style.text.textSBold12.copyWith(
                        color: context.theme.imiotDarkPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
