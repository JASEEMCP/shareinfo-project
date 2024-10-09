import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/profile/widget/_toggle_tile_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenSecurity extends StatelessWidget {
  const ScreenSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: buildCustomAppBar(context,
          title: "Security", enableSuffixIcon: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ValueListenableBuilder(
                      valueListenable: settingsLogic.rememberMe,
                      builder: (context, enabled, _) {
                        return ToggleListTileWidget(
                          title: 'Remember me',
                          value: enabled,
                          onPressed: (value) {
                            settingsLogic.rememberMe.value = value;
                          },
                        );
                      }),
                  Padding(
                    padding: EdgeInsets.only(
                      left: inset.md,
                      right: inset.md,
                      bottom: inset.md,
                    ),
                    child: Column(
                      children: [
                        Gap(inset.md),
                        CustomElevatedButton(
                          backgroundColor: context.theme.lightBlue,
                          buttonName: "Change Password",
                          buttonTextColor: context.theme.imiotDarkPurple,
                          width: ElevatedButtonWidth.large,
                          onPressed: () {
                            context.go(ScreenPath.changePassword);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ListTile(
//   onTap: () {},
//   dense: true,
//   contentPadding: EdgeInsets.only(
//     left: inset.md,
//     right: inset.md,
//   ),
//   title: Text(
//     'Google Authenticator',
//     style: $style.txtStyle.labelSBold12.copyWith(
//       color: context.txtTheme.titleLarge!.color,
//     ),
//   ),
//   trailing: Icon(
//     Icons.arrow_forward_ios_outlined,
//     size: inset.sm + 5,
//     color: context.theme.onBackground,
//   ),
// ),
