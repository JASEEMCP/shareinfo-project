// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shareinfo/style/colors.dart';

@immutable
class AppStyle {
  AppStyle({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const mobile = 600;
    const tablet = 1100;

    if (shortestSide > tablet) {
      scale = 1.5;
    } else if (shortestSide < tablet && shortestSide > mobile) {
      scale = 1;
    } else {
      scale = 1;
    }
  }

  late final double scale;

  /// The current theme colors for the app
  final AppColors colors = AppColors();

  /// Rounded edge corner radii
  late final _Corners corners = _Corners();

  /// Padding and margin values
  late final _Insets insets = _Insets(scale);

  /// Text styles
  late final _TextStyles text = _TextStyles(scale: scale);

  /// Animation Durations
  final _Times times = _Times();

  /// Font size
}

@immutable
class _TextStyles {
  _TextStyles({required this.scale});
  final double scale;
  final fSize = _FontSize();

  final TextStyle hNormal = const TextStyle(fontWeight: FontWeight.w400);
  final TextStyle hSBold = const TextStyle(fontWeight: FontWeight.w600);
  final TextStyle hBold = const TextStyle(fontWeight: FontWeight.bold);
  final TextStyle hExtraBold = const TextStyle(fontWeight: FontWeight.w800);

  // Bold Fonts
  late final TextStyle textBold8 = _createFont(hBold, sizePx: fSize.s8);

  late final TextStyle textBold10 = _createFont(hBold, sizePx: fSize.s10);

  late final TextStyle textBold12 = _createFont(hBold, sizePx: fSize.s12);

  late final TextStyle textBold14 = _createFont(hBold, sizePx: fSize.s14);

  late final TextStyle textBold16 = _createFont(hBold, sizePx: fSize.s16);

  late final TextStyle textBold18 = _createFont(hBold, sizePx: fSize.s18);

  late final TextStyle textBold20 = _createFont(hBold, sizePx: fSize.s20);

  late final TextStyle textBold22 = _createFont(hBold, sizePx: fSize.s22);

  late final TextStyle textBold26 = _createFont(hBold, sizePx: fSize.s26);

  late final TextStyle textBold28 = _createFont(hBold, sizePx: fSize.s28);

  late final TextStyle textBold30 = _createFont(hBold, sizePx: fSize.s30);

  // Semi-Bold
  late final TextStyle textSBold10 = _createFont(hSBold, sizePx: fSize.s10);

  late final TextStyle textSBold12 = _createFont(hSBold, sizePx: fSize.s12);

  late final TextStyle textSBold14 = _createFont(hSBold, sizePx: fSize.s14);

  late final TextStyle textSBold16 = _createFont(hSBold, sizePx: fSize.s16);

  late final TextStyle textSBold18 = _createFont(hSBold, sizePx: fSize.s18);

  late final TextStyle textSBold20 = _createFont(hSBold, sizePx: fSize.s20);

  late final TextStyle textSBold22 = _createFont(hSBold, sizePx: fSize.s22);

  late final TextStyle textSBold26 = _createFont(hSBold, sizePx: fSize.s26);

  late final TextStyle textSBold28 = _createFont(hSBold, sizePx: fSize.s28);

  late final TextStyle textSBold30 = _createFont(hSBold, sizePx: fSize.s30);

  // Normal-font
  late final TextStyle textN10 = _createFont(hNormal, sizePx: fSize.s10);

  late final TextStyle textN12 = _createFont(hNormal, sizePx: fSize.s12);

  late final TextStyle textN14 = _createFont(hNormal, sizePx: fSize.s14);

  late final TextStyle textN16 = _createFont(hNormal, sizePx: fSize.s16);

  late final TextStyle textN18 = _createFont(hNormal, sizePx: fSize.s18);

  late final TextStyle textN22 = _createFont(hNormal, sizePx: fSize.s22);

  late final TextStyle textN26 = _createFont(hNormal, sizePx: fSize.s24);

  // Extra-Bold
  late final TextStyle textEBold10 = _createFont(hExtraBold, sizePx: fSize.s10);

  late final TextStyle textEBold12 = _createFont(hExtraBold, sizePx: fSize.s12);

  late final TextStyle textEBold14 = _createFont(hExtraBold, sizePx: fSize.s14);

  late final TextStyle textEBold16 = _createFont(hExtraBold, sizePx: fSize.s16);

  late final TextStyle textEBold18 = _createFont(hExtraBold, sizePx: fSize.s18);

  late final TextStyle textEBold22 = _createFont(hExtraBold, sizePx: fSize.s22);

  late final TextStyle textEBold26 = _createFont(hExtraBold, sizePx: fSize.s26);

  TextStyle _createFont(TextStyle style,
      {required double sizePx, String? fontFamily}) {
    sizePx *= scale;
    return style.copyWith(
      fontFamily: fontFamily ?? 'Nunito',
      fontSize: sizePx,
    );
  }
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _FontSize {
  final double s8 = 8.0;
  final double s10 = 10.0;
  final double s12 = 12.0;
  final double s14 = 14.0;
  final double s16 = 16.5;
  final double s18 = 18.5;
  final double s20 = 20.0;
  final double s22 = 22.0;
  final double s24 = 24.0;
  final double s26 = 26.0;
  final double s28 = 28.0;
  final double s30 = 30.0;
  final double s32 = 32.0;
}

@immutable
class _Corners {
  late final double sm = 15;
  late final double md = 20;
  late final double lg = 30;
}

@immutable
class _Insets {
  _Insets(this._scale);
  final double _scale;

  late final double xxxs = 3 * _scale;
  late final double xxs = 5 * _scale;
  late final double xs = 10 * _scale;
  late final double sm = 15 * _scale;
  late final double md = 20 * _scale;
  late final double xm = 23 * _scale;
  late final double lg = 25 * _scale;
  late final double xl = 30 * _scale;
  late final double xxl = 40 * _scale;
  late final double offset = 50 * _scale;
  late final double offset1 = 60 * _scale;

  // late final double xxxs = 2 * _scale;
  // late final double xxs = 4 * _scale;
  // late final double xs = 8 * _scale;
  // late final double sm = 16 * _scale;
  // late final double md = 24 * _scale;
  // late final double lg = 32 * _scale;
  // late final double xl = 48 * _scale;
  // late final double xxl = 56 * _scale;
  // late final double offset = 80 * _scale;
}
