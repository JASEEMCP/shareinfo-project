import 'package:flutter/material.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/core/settings_path.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPathModel {
  final Widget icon;
  final IconData? trailingIcon;
  final String title;
  final SettingPath? path;
  final Function(BuildContext)? onTap;
  SettingsPathModel({
    required this.icon,
    this.path,
    required this.title,
    this.trailingIcon,
    this.onTap,
  });
  static const urlPath = 'https://shareinfo.imiot.co.in/';
  static List<SettingsPathModel> accountTileList = [
    SettingsPathModel(
      icon: const Icon(Icons.account_circle_rounded),
      title: "Personal  Information",
      path: SettingPath.personalInfo,
    ),
    // SettingsPathModel(
    //   icon: const Icon(Icons.compare_arrows_outlined),
    //   title: "Linked Accounts",
    // ),
  ];
  static List<SettingsPathModel> generalTileList = [
    // SettingsPathModel(
    //   icon: const Icon(Icons.notifications_none),
    //   title: "Notifications",
    //   trailingIcon: Icons.arrow_forward_ios_outlined,
    //   path: SettingPath.notification,
    // ),
    SettingsPathModel(
      icon: const Icon(Icons.security),
      title: "Security",
      trailingIcon: Icons.arrow_forward_ios_outlined,
      path: SettingPath.security,
    ),
    SettingsPathModel(
      icon: const Icon(Icons.language),
      title: "App Language",
      trailingIcon: Icons.arrow_forward_ios_outlined,
      path: SettingPath.appLanguage,
    ),
    SettingsPathModel(
      icon: const Icon(Icons.info),
      title: "Help Center",
      trailingIcon: Icons.arrow_forward_ios_outlined,
      onTap: (_) {
        launchEmail();
      },
    ),
    SettingsPathModel(
      icon: const Icon(Icons.group),
      title: "Invite Friends",
      trailingIcon: Icons.arrow_forward_ios_outlined,
      onTap: (_) {
        shareInviteLink();
      },
    ),
    // SettingsPathModel(
    //   icon: const Icon(Icons.star_border),
    //   title: "Rate Us",
    //   trailingIcon: Icons.arrow_forward_ios_outlined,
    //   onTap: (_) {
    //     openPlayStore();
    //   },
    // ),
  ];

  static List<SettingsPathModel> actionTileList = [
    SettingsPathModel(
      icon: const Icon(Icons.open_in_new),
      title: "Privacy & Policy",
      onTap: (_) {
        openWeb(urlPath);
      },
    ),
    SettingsPathModel(
      icon: const Icon(Icons.open_in_new),
      title: "Terms Of Service",
      onTap: (_) {
        openWeb(urlPath);
      },
    ),
    SettingsPathModel(
      icon: const Icon(Icons.open_in_new),
      title: "About Us",
      onTap: (_) {
        openWeb('https://imiot.co.in/#our_team');
      },
    ),
  ];
  static List<SettingsPathModel> accountConfigTileList = [
    SettingsPathModel(
      icon: const Icon(Icons.person_remove_outlined),
      title: "Deactivate My Account",
      trailingIcon: Icons.arrow_forward_ios_outlined,
      path: SettingPath.deactivateAccount,
    ),
    SettingsPathModel(
      icon: const Icon(Icons.no_accounts_outlined),
      title: "Delete Account",
      trailingIcon: Icons.arrow_forward_ios_outlined,
      path: SettingPath.deleteAccount,
    ),
    SettingsPathModel(
      icon: const Icon(Icons.exit_to_app),
      title: "Log Out",
      onTap: (context) {
        context.logoutWarningAlert(() async {
          await getIt<LoginCubit>().logout();
        });
      },
    ),
  ];
  static Future<void> launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'accountsupport@shareinfo.io',
      query:
          '%23Urgent%2C%20Account%20Help%20Center%3B%20ShareInfo%20for%20Aspirants&body=Hey%20Support%20Team%2C%0A%0A%7BEstablish%20Your%20Issue%20Here%7D',
    );

    await launchUrl(emailLaunchUri);
  }
}
