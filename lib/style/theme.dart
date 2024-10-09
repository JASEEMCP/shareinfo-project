import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shareinfo/style/colors.dart';

enum ThemeType {
  shareInfoLight,
  shareInfoDark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.shareInfoLight;

  bool isDark;
  Color shareinfoLightBlue;
  Color shareinfoMidBlue;
  Color shareinfoBlue;
  Color shareinfoOrange;
  Color shareinfoGreen;
  Color shareinfoYellow;
  Color shareinfoRed;
  Color shareinfoGrey;
  Color shareinfoWhite;
  Color imiotDeepPurple;
  Color shareinfoBlack;
  Color shareinfoTextDark;
  Color shareinfoGreyLite;
  Color lightBlue;
  Color imiotDarkPurple;
  //Common color
  Color statusBlue;
  Color statusBlueAccentDark;
  Color statusYellow;
  Color statusYellowAccentDark;
  Color statusRed;
  Color statusRedAccentDark;
  Color statusGreen;
  Color statusGreenAccentDark;
  Color statusPurple;
  Color statusPurpleAccentDark;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.shareinfoBlack,
    required this.shareinfoBlue,
    required this.shareinfoGreen,
    required this.shareinfoGrey,
    required this.shareinfoGreyLite,
    required this.shareinfoLightBlue,
    required this.shareinfoMidBlue,
    required this.shareinfoOrange,
    required this.shareinfoRed,
    required this.shareinfoTextDark,
    required this.shareinfoWhite,
    required this.shareinfoYellow,
    required this.imiotDeepPurple,
    required this.lightBlue,
    required this.imiotDarkPurple,
    required this.statusBlue,
    required this.statusBlueAccentDark,
    required this.statusGreen,
    required this.statusGreenAccentDark,
    required this.statusPurple,
    required this.statusPurpleAccentDark,
    required this.statusRed,
    required this.statusRedAccentDark,
    required this.statusYellow,
    required this.statusYellowAccentDark,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.shareInfoLight:
        return AppTheme(
          isDark: false,
          shareinfoBlack: AppColors.shareinfoBlack,
          shareinfoBlue: AppColors.shareinfoBlue,
          shareinfoGreen: AppColors.shareinfoGreen,
          shareinfoGrey: AppColors.shareinfoGrey,
          shareinfoGreyLite: AppColors.shareinfoGreyLite,
          shareinfoLightBlue: AppColors.shareinfoLightBlue,
          shareinfoMidBlue: AppColors.shareinfoBlue,
          shareinfoOrange: AppColors.shareinfoOrange,
          shareinfoRed: AppColors.shareinfoRed,
          shareinfoTextDark: AppColors.shareinfoTextDark,
          shareinfoWhite: AppColors.shareinfoWhite,
          shareinfoYellow: AppColors.shareinfoYellow,
          imiotDeepPurple: AppColors.imiotDeepPurple,
          lightBlue: AppColors.lightBlue,
          imiotDarkPurple: AppColors.imiotDarkPurple,
          //Common color
          statusRedAccentDark: AppColors.statusRedAccentDark,
          statusBlue: AppColors.statusBlue,
          statusBlueAccentDark: AppColors.statusBlueAccentDark,
          statusGreen: AppColors.statusGreen,
          statusGreenAccentDark: AppColors.statusGreenAccentDark,
          statusPurple: AppColors.statusPurple,
          statusPurpleAccentDark: AppColors.statusPurpleAccentDark,
          statusRed: AppColors.statusRed,
          statusYellow: AppColors.statusYellow,
          statusYellowAccentDark: AppColors.statusYellowAccentDark,
        );

      case ThemeType.shareInfoDark:
        return AppTheme(
          isDark: true,
          shareinfoBlack: AppColors.shareinfoBlack,
          shareinfoBlue: AppColors.shareinfoBlue,
          shareinfoGreen: AppColors.shareinfoGreen,
          shareinfoGrey: AppColors.shareinfoGrey,
          shareinfoGreyLite: AppColors.shareinfoGreyLite,
          shareinfoLightBlue: AppColors.shareinfoLightBlue,
          shareinfoMidBlue: AppColors.shareinfoBlue,
          shareinfoOrange: AppColors.shareinfoOrange,
          shareinfoRed: AppColors.shareinfoRed,
          shareinfoTextDark: AppColors.shareinfoTextDark,
          shareinfoWhite: AppColors.shareinfoBlack,
          shareinfoYellow: AppColors.shareinfoYellow,
          imiotDeepPurple: AppColors.imiotDeepPurple,
          lightBlue: AppColors.lightBlue,
          imiotDarkPurple: AppColors.imiotDarkPurple,
          //Common color
          statusRedAccentDark: AppColors.statusRedAccentDark,
          statusBlue: AppColors.statusBlue,
          statusBlueAccentDark: AppColors.statusBlueAccentDark,
          statusGreen: AppColors.statusGreen,
          statusGreenAccentDark: AppColors.statusGreenAccentDark,
          statusPurple: AppColors.statusPurple,
          statusPurpleAccentDark: AppColors.statusPurpleAccentDark,
          statusRed: AppColors.statusRed,
          statusYellow: AppColors.statusYellow,
          statusYellowAccentDark: AppColors.statusYellowAccentDark,
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData(
      fontFamily: 'Nunito',
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: shareinfoWhite,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: shareinfoWhite, // Navigation bar
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: shareinfoBlue.withOpacity(0.1),
      ),
      textTheme:
          (isDark ? ThemeData.dark() : ThemeData.light()).textTheme.copyWith(),
      // datePickerTheme: DatePickerThemeData(
      //   dayStyle: TextStyle(
      //       color: Colors.red, // Set your desired text color here
      //     ),
      //   todayBackgroundColor: WidgetStatePropertyAll(shareinfoWhite),
      //   todayForegroundColor: WidgetStatePropertyAll(shareinfoWhite),
      //   cancelButtonStyle: TextButton.styleFrom(
      //     backgroundColor: shareinfoMidBlue,
      //     foregroundColor: shareinfoWhite,
      //     //textStyle: $style.texts.textBold14,
      //   ),
      //   confirmButtonStyle: TextButton.styleFrom(
      //     backgroundColor: shareinfoMidBlue,
      //     foregroundColor: shareinfoWhite,
      //     //textStyle: $style.text.textBold14,
      //),
      // inputDecorationTheme: InputDecorationTheme(
      //     floatingLabelBehavior: FloatingLabelBehavior.never,
      //     focusColor: shareinfoBlack,
      //     border: const OutlineInputBorder(),
      // labelStyle: $style.text.textBold14.copyWith(
      //   color: shareinfoBlack,
      // ),
      // focusedBorder: const OutlineInputBorder()),
      // headerHelpStyle: $style.text.textBold14.copyWith(
      //   color: shareinfoBlack,
      // ),
      //),
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: shareinfoBlue,
        primaryContainer: shareinfoGreen,
        secondary: shareinfoLightBlue,
        surface: shareinfoWhite,
        onSurface: shareinfoBlack,
        onError: shareinfoYellow,
        onPrimary: shareinfoBlue,
        onSecondary: imiotDeepPurple,
        error: shareinfoRed,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
