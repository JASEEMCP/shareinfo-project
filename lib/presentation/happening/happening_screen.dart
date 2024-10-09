import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/happening/screens/event_occurred_screen.dart';
import 'package:shareinfo/presentation/happening/screens/my_registration_screen.dart';
import 'package:shareinfo/presentation/happening/screens/upcoming_screen.dart';
import 'package:shareinfo/presentation/widget/custom_circular_icon_button.dart';

class ScreenHappening extends StatefulWidget {
  const ScreenHappening({super.key});

  @override
  State<ScreenHappening> createState() => _ScreenHappeningState();
}

class _ScreenHappeningState extends State<ScreenHappening>
    with SingleTickerProviderStateMixin {
  final tabName = [
    'Upcoming',
    'My Registration',
    'Occurred',
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //Initialize notification
    _tabController = TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: inset.sm,
          actions: [
            Hero(
              tag: 'event_search',
              child: Material(
                child: CircularIconButton(
                  icon: Icons.search,
                  onPressed: () {
                    context.go(ScreenPath.searchHappening);
                  },
                ),
              ),
            ),
            Hero(
              tag: 'saved_event',
              child: Material(
                child: CircularIconButton(
                  icon: Icons.bookmark_outline,
                  onPressed: () {
                    context.go(ScreenPath.savedHappening);
                  },
                ),
              ),
            ),
          ],
          //Search Field
          title: Row(
            children: [
              Image.asset(
                ImagePaths.shareInfoLogo,
                height: 23,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'ShareInfo',
                    textScaler: const TextScaler.linear(1),
                    style: $style.text.textBold12.copyWith(
                      color: context.theme.shareinfoOrange,
                    ),
                  ),
                  Text(
                    'Happenings',
                    textScaler: const TextScaler.linear(1),
                    style: $style.text.textBold10.copyWith(
                      color: context.theme.shareinfoBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(0, kToolbarHeight),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(right: 3, left: 10),
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    labelStyle: $style.text.textBold14.copyWith(
                      color: context.theme.shareinfoBlue,
                      fontFamily: 'Nunito',
                    ),
                    unselectedLabelColor:
                        context.theme.shareinfoBlue.withOpacity(0.6),
                    indicatorColor: Colors.transparent,
                    enableFeedback: true,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    tabs: [
                      for (var name in tabName) Tab(text: name),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            ScreenUpcoming(),
            ScreenMyRegistration(),
            ScreenEventOccurred(),
          ],
        ),
      ),
    );
  }
}
