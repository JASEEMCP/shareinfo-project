// import 'package:flutter/material.dart';

// @immutable
// class AppStyle {
//   AppStyle({Size? screenSize}) {
//     if (screenSize == null) {
//       scale = 0.85;
//       return;
//     }
//     final shortestSide = screenSize.shortestSide;
//     const tabletXl = 1000;
//     const tabletLg = 800;
//     const tabletSm = 600;
//     const phoneLg = 400;
//     if (shortestSide > tabletXl) {
//       scale = 0.9;
//     } else if (shortestSide > tabletLg) {
//       scale = 0.9;
//     } else if (shortestSide > tabletSm) {
//       scale = 0.9;
//     } else if (shortestSide > phoneLg) {
//       scale = 0.9; // phone
//     } else {
//       scale = 0.95; // small phone
//     }
//   }

//   late final double scale;
//   late final times = _Durations();
//   late final txtStyle = _TextStyles(scale: scale);
//   late final fontFamily = _Fonts();
//   late final inset = _Insets(scale);
// }

// @immutable
// class _Durations {
//   final Duration fastest = const Duration(milliseconds: 150);
//   final Duration fast = const Duration(milliseconds: 250);
//   final Duration medium = const Duration(milliseconds: 350);
//   final Duration slow = const Duration(milliseconds: 1200);
// }

// @immutable
// class _FontSize {
//   final double s30 = 31.0;
//   final double s25 = 26.0;
//   final double s20 = 22.0;
//   final double s18 = 19.0;
//   final double s15 = 16.0;
//   final double s13 = 14.0;
//   final double s12 = 15.0;
//   final double s11 = 13.5;
//   final double ss10 = 12.5;
//   final double s10 = 11.0;
//   final double s9 = 10.0;
//   final double s8 = 9.0;
//   final double s7 = 8.0;
// }

// @immutable
// class _Fonts {
//   final String montserrat = 'Montserrat';
//   final String nunito = 'Nunito';
// }

// @immutable
// class _TextStyles {
//   _TextStyles({required this.scale});
//   final double scale;
//   final fSize = _FontSize();

//   final TextStyle contentFontNormal =
//       const TextStyle(fontWeight: FontWeight.w400);
//   final TextStyle contentFontSemiBold =
//       const TextStyle(fontWeight: FontWeight.w600);
//   final TextStyle contentFontBold =
//       const TextStyle(fontWeight: FontWeight.bold);
//   final TextStyle contentFontExtraBold =
//       const TextStyle(fontWeight: FontWeight.w800);

//   late final TextStyle titleBold15 =
//       _createFont(contentFontBold, sizePx: fSize.s15);
//   late final TextStyle titleBold18 =
//       _createFont(contentFontBold, sizePx: fSize.s18);
//   late final TextStyle titleBold20 =
//       _createFont(contentFontBold, sizePx: fSize.s20);
//   late final TextStyle titleBold25 =
//       _createFont(contentFontBold, sizePx: fSize.s25);
//   late final TextStyle titleBold30 =
//       _createFont(contentFontBold, sizePx: fSize.s30);

//   late final TextStyle titleSBold15 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s15);
//   late final TextStyle titleSBold18 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s18);
//   late final TextStyle titleRegular15 =
//       _createFont(contentFontNormal, sizePx: fSize.s15);

//   late final TextStyle labelBold13 =
//       _createFont(contentFontBold, sizePx: fSize.s13);
//   late final TextStyle labelBold12 =
//       _createFont(contentFontBold, sizePx: fSize.s12);
//   late final TextStyle labelBold11 =
//       _createFont(contentFontBold, sizePx: fSize.s11);
//   late final TextStyle labelBoldS10 =
//       _createFont(contentFontBold, sizePx: fSize.ss10);
//   late final TextStyle labelBold10 =
//       _createFont(contentFontBold, sizePx: fSize.s10);
//   late final TextStyle labelBold9 =
//       _createFont(contentFontBold, sizePx: fSize.s9);
//   late final TextStyle labelBold8 =
//       _createFont(contentFontBold, sizePx: fSize.s8);
//   late final TextStyle labelBold7 =
//       _createFont(contentFontBold, sizePx: fSize.s7);

//   late final TextStyle labelSBold13 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s13);
//   late final TextStyle labelSBold12 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s12);
//   late final TextStyle labelRegular12 =
//       _createFont(contentFontNormal, sizePx: fSize.s12);
//   late final TextStyle labelSBold11 =
//       _createFont(contentFontBold, sizePx: fSize.s11);
//   late final TextStyle labelSBoldS10 =
//       _createFont(contentFontSemiBold, sizePx: fSize.ss10);
//   late final TextStyle labelSBold10 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s10);
//   late final TextStyle labelSBold9 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s9);
//   late final TextStyle labelSBold8 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s8);
//   late final TextStyle labelSBold7 =
//       _createFont(contentFontSemiBold, sizePx: fSize.s7);

//   TextStyle _createFont(TextStyle style, {required double sizePx}) {
//     sizePx *= scale;
//     return style.copyWith(
//       fontSize: sizePx,
//     );
//   }
// }

// @immutable
// class _Insets {
//   _Insets(this._scale);
//   final double _scale;

//   late final double xxxs = 3 * _scale;
//   late final double xxs = 5 * _scale;
//   late final double xs = 10 * _scale;
//   late final double sm = 15 * _scale;
//   late final double md = 20 * _scale;
//   late final double xm = 23 * _scale;
//   late final double lg = 25 * _scale;
//   late final double xl = 30 * _scale;
//   late final double xxl = 40 * _scale;
//   late final double offset = 50 * _scale;
//   late final double offset1 = 60 * _scale;
// }
// // @immutable
// // class _Corners {
// //   late final double sm = 4;
// //   late final double md = 8;
// //   late final double lg = 32;
// // }
