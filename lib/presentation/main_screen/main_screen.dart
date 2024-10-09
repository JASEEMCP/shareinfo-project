import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

import 'package:shareinfo/presentation/jobs/job_screen.dart';
import 'package:shareinfo/presentation/main_screen/_end_drawer.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

//Tab controller
ValueNotifier<int> tabChangeNotifier = ValueNotifier(0);

class ScreenMain extends StatefulWidget {
  const ScreenMain({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  late SharedPreferences pref;

  int currentIndex = 0;
  @override
  void initState() {
    _checkAppUpdate();
    super.initState();
  }

  Future<void> _checkAppUpdate() async {
    final url = '${Env().apiBaseUrl}candidate/version-note/';
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final buildNo = int.parse(packageInfo.buildNumber);
      final versionName = packageInfo.version;
      final response = (await Dio().get(url)).data;
      if (buildNo != response['version_code'] ||
          versionName != response['version_name']) {
        return appRouter.go('/update');
      }
      settingsLogic.update.value = false;
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: false,
      key: scKey,
      extendBody: true,
      body: widget.child,
      bottomNavigationBar: _buildNavigationBar(context),
      endDrawer: buildEndDrawer(context, jobTypeNotifier),
    );
  }

  ValueListenableBuilder _buildNavigationBar(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tabChangeNotifier,
        builder: (context, tabIndex, _) {
          currentIndex = tabIndex;
          return NavigationBar(
            height: 70,
            selectedIndex: tabIndex,
            indicatorColor: context.theme.imiotDeepPurple.withOpacity(0.2),
            onDestinationSelected: (index) {
              HapticFeedback.mediumImpact();
              if (tabIndex == index) return;
              switch (index) {
                case 0:
                  context.go(ScreenPath.home);
                  break;
                case 1:
                  context.go(ScreenPath.practice);
                  break;
                case 2:
                  context.go(ScreenPath.jobs);
                  break;
                case 3:
                  context.go(ScreenPath.happening);
                  break;
                case 4:
                  context.go(ScreenPath.profile);
                  break;
                default:
                  context.go(ScreenPath.home);
                  break;
              }

              tabChangeNotifier.value = index;
            },
            surfaceTintColor: Colors.transparent,
            backgroundColor: context.theme.shareinfoWhite,
            animationDuration: $style.times.slow,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: context.theme.imiotDarkPurple,
                ),
                label: 'Home',
                selectedIcon: Icon(
                  Icons.home,
                  color: context.theme.imiotDarkPurple,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.hourglass_top,
                  color: context.theme.imiotDarkPurple,
                ),
                label: 'Practice',
                selectedIcon: Icon(
                  Icons.hourglass_bottom,
                  color: context.theme.imiotDarkPurple,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.track_changes_outlined,
                  color: context.theme.imiotDarkPurple,
                ),
                label: 'Jobs',
                selectedIcon: Icon(
                  Icons.track_changes,
                  color: context.theme.imiotDarkPurple,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.event_outlined,
                  color: context.theme.imiotDarkPurple,
                ),
                label: 'Happenings',
                selectedIcon: Icon(
                  Icons.event,
                  color: context.theme.imiotDarkPurple,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_outlined,
                  color: context.theme.imiotDarkPurple,
                ),
                label: 'Profile',
                selectedIcon: Icon(
                  Icons.person,
                  color: context.theme.imiotDarkPurple,
                ),
              )
            ],
          );
        });
  }
}
