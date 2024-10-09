import 'package:flutter/material.dart';

const int mobileSize = 500;
const int tabletSize = 900;
const int desktopSize = 1300;

class ResponsiveWidget extends StatelessWidget {
  // the custom screen size is specific to this project
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileSize;
  }

  static bool isTabletScreen(BuildContext context) {
    final mq = MediaQuery.of(context).size.width;

    return mq <= tabletSize && mq <= desktopSize;
  }

  static bool isLargeScreen(BuildContext context) {
    final mq = MediaQuery.of(context).size.width;
    return mq >= desktopSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileSize) {
          return mobile;
        } else if (constraints.maxWidth < tabletSize) {
          return tablet ?? mobile;
        } else {
          return tablet ?? mobile;
        }
      },
    );
  }
}
