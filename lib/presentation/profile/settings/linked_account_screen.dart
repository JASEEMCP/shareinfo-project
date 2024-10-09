import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/profile/widget/_settings_tile_widget.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';

import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';

class ScreenLinkedAccounts extends StatelessWidget {
  const ScreenLinkedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: "Linked Accounts",
        enableSuffixIcon: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SettingsTileWidget(
                    leadingIcon: Image.asset(
                      ImagePaths.googleLogo,
                      height: 20,
                      width: 20,
                    ),
                    text: 'General Notifications',
                    onPressed: () {},
                    suffix: _buildToggleSwitch(context),
                  ),
                  SettingsTileWidget(
                    leadingIcon: Image.asset(
                      ImagePaths.googleLogo,
                      height: 20,
                      width: 20,
                    ),
                    text: 'Facebook',
                    onPressed: () {},
                    suffix: _buildToggleSwitch(context),
                  ),
                  SettingsTileWidget(
                    leadingIcon: Image.asset(
                      ImagePaths.googleLogo,
                      height: 20,
                      width: 20,
                    ),
                    text: 'Instagram',
                    onPressed: () {},
                    suffix: _buildToggleSwitch(context),
                  ),
                  SettingsTileWidget(
                    leadingIcon: Image.asset(
                      ImagePaths.googleLogo,
                      height: 20,
                      width: 20,
                    ),
                    text: 'LinkedIn',
                    onPressed: () {},
                    suffix: _buildToggleSwitch(context),
                  ),
                  SettingsTileWidget(
                    leadingIcon: Image.asset(
                      ImagePaths.googleLogo,
                      height: 20,
                      width: 20,
                    ),
                    text: 'X (old Twitter)',
                    onPressed: () {},
                    suffix: _buildToggleSwitch(context),
                  ),
                  Gap(inset.md),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: inset.md,
                right: inset.md,
                bottom: inset.md,
              ),
              child: CustomElevatedButton(
                buttonName: 'Save',
                width: ElevatedButtonWidth.large,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Transform _buildToggleSwitch(BuildContext context) {
    return Transform.scale(
      scale: 0.85,
      alignment: Alignment.centerRight,
      child: Switch(
        activeColor: context.theme.imiotDarkPurple,
        activeTrackColor: context.theme.shareinfoWhite,
        trackOutlineColor:
            WidgetStatePropertyAll(context.theme.imiotDarkPurple),
        value: false,
        onChanged: (v) {},
      ),
    );
  }
}
