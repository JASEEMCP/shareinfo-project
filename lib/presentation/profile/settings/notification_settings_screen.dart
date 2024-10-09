import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/profile/widget/_toggle_tile_widget.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class ScreenNotificationSettings extends StatelessWidget {
  const ScreenNotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: "Notifications",
        enableSuffixIcon: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ValueListenableBuilder(
                    valueListenable: settingsLogic.enableNotification,
                    builder: (context, isEnable, _) {
                      return ToggleListTileWidget(
                        value: isEnable,
                        title: 'General Notifications',
                        onPressed: (value) {
                          settingsLogic.enableNotification.value = value;
                        },
                      );
                    },
                  ),
                  // ValueListenableBuilder(
                  //     valueListenable: settingsLogic.sound,
                  //     builder: (context, isEnable, _) {
                  //       return ToggleListTileWidget(
                  //         value: isEnable,
                  //         title: 'Sound',
                  //         onPressed: (value) {
                  //           settingsLogic.sound.value = value;
                  //         },
                  //       );
                  //     }),
                  // ValueListenableBuilder(
                  //     valueListenable: settingsLogic.vibration,
                  //     builder: (context, isEnable, _) {
                  //       return ToggleListTileWidget(
                  //         value: isEnable,
                  //         title: 'Vibrate',
                  //         onPressed: (value) {
                  //          // settingsLogic.vibration.value = value;
                  //         },
                  //       );
                  //     }),
                  Gap(inset.md),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
