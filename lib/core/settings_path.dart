import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/profile/settings/delete_account_screen.dart';
import 'package:shareinfo/presentation/profile/settings/deactivate_account_screen.dart';
import 'package:shareinfo/presentation/profile/settings/job_seeking_status_screen.dart';
import 'package:shareinfo/presentation/profile/settings/language_settings_screen.dart';
import 'package:shareinfo/presentation/profile/settings/notification_settings_screen.dart';
import 'package:shareinfo/presentation/profile/settings/personal_info_config_screen.dart';
import 'package:shareinfo/presentation/profile/settings/security_screen.dart';
import 'package:shareinfo/presentation/widget/views/error_views/page_not_found.dart';

enum SettingPath {
  jobSeeking,
  personalInfo,
  notification,
  appLanguage,
  security,
  deactivateAccount,
  deleteAccount,
}

Widget returnSettingScreen(SettingPath type) {
  switch (type) {
    case SettingPath.jobSeeking:
      return const ScreenJobSeekingStatusSetting();
    case SettingPath.personalInfo:
      return const ScreenPersonalInfoConfig();
    case SettingPath.notification:
      return const ScreenNotificationSettings();
    case SettingPath.security:
      return const ScreenSecurity();
    case SettingPath.appLanguage:
      return ScreenLanguageSettings();
    case SettingPath.deactivateAccount:
      return const ScreenDeactivateAccount();
    case SettingPath.deleteAccount:
      return ScreenDeleteAccount();
    default:
      return const PageNotFound();
  }
}

String returnSettingPath(SettingPath type) {
  switch (type) {
    case SettingPath.jobSeeking:
      return '/job_seeking';
    case SettingPath.personalInfo:
      return '/personal_info_setting';
    case SettingPath.notification:
      return '/notification';
    case SettingPath.security:
      return '/security';
    case SettingPath.appLanguage:
      return '/app_language';
    case SettingPath.deactivateAccount:
      return '/deactivate_account';
    case SettingPath.deleteAccount:
      return '/delete_account';
    default:
      return '/personal_info_setting';
  }
}

SettingPath returnSettingEnum(String value) {
  switch (value) {
    case 'job_seeking':
      return SettingPath.jobSeeking;
    case 'personal_info_setting':
      return SettingPath.personalInfo;
    case 'notification':
      return SettingPath.notification;
    case 'security':
      return SettingPath.security;
    case 'app_language':
      return SettingPath.appLanguage;
    case 'deactivate_account':
      return SettingPath.deactivateAccount;
    case 'delete_account':
      return SettingPath.deleteAccount;
    default:
      return SettingPath.personalInfo;
  }
}
