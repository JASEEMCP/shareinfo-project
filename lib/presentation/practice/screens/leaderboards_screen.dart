import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_circular_icon_button.dart';
import 'package:shareinfo/presentation/widget/leaderborads_widget.dart';

class ScreenLeaderboards extends StatefulWidget {
  const ScreenLeaderboards({super.key});

  @override
  State<ScreenLeaderboards> createState() => _ScreenLeaderboardsState();
}

class _ScreenLeaderboardsState extends State<ScreenLeaderboards>
    with SingleTickerProviderStateMixin {
  final tabName = [
    'Weekly',
    'Monthly',
    'Global',
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
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(0, 90),
            child: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              title: Padding(
                padding: EdgeInsets.only(left: inset.xs),
                child: CircularIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              bottom: TabBar(
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
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                tabs: [
                  for (var name in tabName) Tab(text: name),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              LeaderboardsWidget(
                leaderboardsType: 'weakly',
              ),
              LeaderboardsWidget(
                leaderboardsType: 'monthly',
              ),
              LeaderboardsWidget(
                leaderboardsType: 'global',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
