// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shareinfo/presentation/root_widget.dart';

// ///*****Common colors*****///

// //White color
// const Color kWhite = Colors.white;
// //Black color
// const Color kBlack = Colors.black;
// //Icon color blue
// const Color kBlue = Color(0xff0063ff);
// //Default text color
// const Color defaultTextColor = Color(0xff260446);
// //Icon grey color
// const Color kGrey20 = Color(0xff7a7a7a);
// const Color kGrey10 = Color(0xfff3f3f3);
// const Color kGrey15 = Color(0xff9e9ba2);

// ///*****Textfield colors*****///

// //Text field hint text color
// const Color kHintColor = Color(0xff9d8eab);
// //Text field unfocused border color
// const Color kBorderUnfocused = Color(0xffd9d9d9);

// ///*****Button colors*****///

// //Default button color
// const Color buttonColor = Color(0xff414eca);
// //Splash screen button color
// const Color splashButtonColor = Color(0xff1626be);
// //Sign in button color
// const Color signInButtonColor = Color(0xff0057e0);
// //Href text color
// const Color hrefColor = Color(0xff2333cf);

// enum ThemeType {
//   shareInfoLight,
//   shareInfoDark,
// }

// class AppTheme {
//   bool isDark;
//   Color white;
//   Color black;

//   Color orangeAccent1;
//   Color orangeAccent2;
//   Color redAccent1;
//   Color redAccent1Dark;
//   Color redAccent2Darker;

//   Color blueAccent1;
//   Color blueAccent2;
//   Color blueAccent3;
//   Color blueAccentDark;

//   Color accent1;
//   Color accent2;
//   Color accent3;
//   Color accent4;
//   Color accent5;
//   Color accent1Dark;

//   Color grey;
//   Color greyDark;
//   Color txtGrey;

//   Color statusBlue;
//   Color statusBlueAccentDark;
//   Color statusYellow;
//   Color statusYellowAccentDark;
//   Color statusRed;
//   Color statusRedAccentDark;
//   Color statusGreen;
//   Color statusGreenAccentDark;
//   Color redAccent2;
//   Color textGreyDark;
//   Color accent6;

//   Color statusPurple;
//   Color statusPurpleAccentDark;
//   Color splashBg;

//   AppTheme({
//     required this.isDark,
//     required this.accent1,
//     required this.accent1Dark,
//     required this.orangeAccent1,
//     required this.accent2,
//     required this.accent3,
//     required this.accent4,
//     required this.black,
//     required this.blueAccent1,
//     required this.blueAccent2,
//     required this.grey,
//     required this.blueAccent3,
//     required this.blueAccentDark,
//     required this.greyDark,
//     required this.orangeAccent2,
//     required this.redAccent1,
//     required this.redAccent1Dark,
//     required this.redAccent2Darker,
//     required this.txtGrey,
//     required this.white,
//     required this.accent5,
//     required this.statusBlue,
//     required this.statusBlueAccentDark,
//     required this.statusGreen,
//     required this.statusGreenAccentDark,
//     required this.statusRed,
//     required this.statusRedAccentDark,
//     required this.redAccent2,
//     required this.statusYellow,
//     required this.statusYellowAccentDark,
//     required this.accent6,
//     required this.textGreyDark,
//     required this.statusPurple,
//     required this.statusPurpleAccentDark,
//     required this.splashBg,
//   });

//   factory AppTheme.fromType() {
//     return AppTheme(
//       isDark: false,

//       accent1: const Color(0xff7d6692), //This is using Home screen
//       accent2: const Color(0xff68507e), //Home tab bar
//       accent3: const Color(0xffdec1f9), //Bottom navigation color
//       accent4: const Color(0xfff3f3f3), //Auth Textfield color
//       accent5: const Color(0xffeaecfe), //Change pin color
//       accent6: const Color(0xfff2f2f2), //Multiline textfield color,
//       accent1Dark: const Color(0xff260446), //common color

//       orangeAccent1: const Color(0xffea4335), //Deactivate color
//       orangeAccent2: const Color(0xfff94612),

//       redAccent1: const Color(0xfffe3038),
//       redAccent2: const Color(0xffffeeed), //Pdf container color
//       redAccent1Dark: const Color(0xffb5050c), //Dialog text red
//       redAccent2Darker: const Color(0xffeb3223), //delete button red

//       black: Colors.black,
//       white: Colors.white,

//       blueAccent1: const Color(0xff0063ff), //edit profile
//       blueAccent2: const Color(0xff0057e0), //Sign in btn
//       blueAccent3: const Color(0xff414eca), //Otp button//Save bookmark,
//       blueAccentDark: const Color(0xff1626be), //save home

//       grey: const Color(0xffd9d9d9), //Divider border
//       greyDark: const Color(0xff7c7c7c), //Status border
//       txtGrey: const Color(0xff9d8eab), //textfield hint text
//       textGreyDark: const Color(0xff434343), //profile subtitle

//       statusBlue: const Color(0xffdfe1f4),
//       statusBlueAccentDark: const Color(0xff4285f4),
//       statusGreen: const Color(0xffdef9e5),
//       statusGreenAccentDark: const Color(0xff34a853),
//       statusRed: const Color(0xfffce1df),
//       statusRedAccentDark: const Color(0xffea4335),
//       statusYellow: const Color(0xfffff6da),
//       statusYellowAccentDark: const Color(0xffc2930f),
//       statusPurple: const Color.fromARGB(252, 240, 214, 237),
//       statusPurpleAccentDark: const Color.fromARGB(255, 92, 8, 85),
//       splashBg: const Color.fromARGB(255, 248, 247, 247),
//     );
//   }

//   ThemeData get themeData {
//     var theme = ThemeData(
//       useMaterial3: true,
//       fontFamily: 'Nunito',
//       appBarTheme: const AppBarTheme(
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: kWhite,
//           statusBarIconBrightness: Brightness.dark,
//           systemNavigationBarColor: kWhite, // Navigation bar
//           systemNavigationBarIconBrightness: Brightness.dark,
//         ),
//         surfaceTintColor: Colors.transparent,
//       ),
//       datePickerTheme: DatePickerThemeData(
//         rangePickerHeaderHelpStyle: $style.txtStyle.labelBold13.copyWith(
//           color: kBlack,
//         ),
//         inputDecorationTheme: InputDecorationTheme(
//           helperStyle: $style.txtStyle.labelBold13.copyWith(
//             color: kBlack,
//           ),
//         ),
//         cancelButtonStyle: TextButton.styleFrom(
//           backgroundColor: blueAccent1,
//           foregroundColor: kWhite,
//           textStyle: $style.txtStyle.labelBold13.copyWith(),
//         ),
//       ),
//       bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: kWhite),
//       colorScheme: ColorScheme(
//         onSecondaryContainer: accent2, //suggestion container,
//         secondaryContainer: accent5, //purple low density,
//         brightness: Brightness.light,
//         primary: blueAccent1, //edit profile
//         onPrimaryContainer: blueAccentDark, //navigating button
//         tertiary: grey, //Divider
//         onTertiary: greyDark, //status border color
//         onPrimary: accent3, //Bottom nav color
//         secondary: blueAccent2, //sign in btn
//         onSecondary: accent6, //multiline textfield
//         error: redAccent2Darker,
//         onError: redAccent1Dark,
//         onErrorContainer: orangeAccent1, //Deactivate color,
//         errorContainer: redAccent2, //Pdf color,
//         // background: white, //Scaffold BG
//         // onBackground: accent1Dark, //Default color
//         tertiaryContainer: blueAccent3, //Bookmark
//         surface: white, //App bar color
//         onSurface: accent1Dark, //Icons color
//       ),
//       textTheme: TextTheme(
//         bodyLarge: const TextStyle().copyWith(color: white),
//         bodyMedium: const TextStyle().copyWith(color: black),
//         titleSmall: const TextStyle().copyWith(color: blueAccent1),
//         bodySmall: const TextStyle().copyWith(color: blueAccent3),
//         labelLarge: const TextStyle().copyWith(color: orangeAccent1),
//         titleLarge:
//             const TextStyle().copyWith(color: accent1Dark), //Default color
//         titleMedium:
//             const TextStyle().copyWith(color: txtGrey), //Text field hint
//         labelMedium: const TextStyle()
//             .copyWith(color: textGreyDark), //profile subtitle/status text
//       ),
//     );

//     return theme;
//   }
// }
