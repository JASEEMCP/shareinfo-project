import 'package:flutter/gestures.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/presentation/home/screens/notification_empty.dart';
import 'package:shareinfo/presentation/home/widget/general_tile_widget.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/status_tile_widget.dart.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

//Declaring tab controller for global access
int tabIndex = 0;

class ScreenNotifications extends StatefulWidget {
  const ScreenNotifications({super.key});

  @override
  State<ScreenNotifications> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<ScreenNotifications>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    //Initialize notification
    tabController = TabController(
      vsync: this,
      length: 2,
    )..addListener(() {
        tabIndex = tabController.index;
      });
    tabController.animateTo(
      tabIndex,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //Change to default state
    tabIndex = 0;

    ///Clear notification
    getIt<NotificationCubit>().clearNotification();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildCustomAppBar(
          context,
          title: "Notifications",
          enableSuffixIcon: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(inset.offset),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: inset.md),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: context.theme.shareinfoGrey,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: tabController,
                  labelPadding: const EdgeInsets.all(0),
                  unselectedLabelColor: context.theme.shareinfoGrey,
                  indicatorColor: context.theme.shareinfoBlue,
                  labelColor: context.theme.shareinfoBlue,
                  labelStyle: $style.text.textBold14.copyWith(
                    fontFamily: 'Nunito',
                  ),
                  tabs: const [
                    Row(children: [Expanded(child: Tab(text: 'General'))]),
                    Row(children: [Expanded(child: Tab(text: 'Application'))]),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            context.watch<NotificationCubit>().state;
            List<GeneralNotificationModel> generalList =
                getIt<NotificationCubit>().generalList;

            List<ApplicationNotificationModel> applicationList =
                getIt<NotificationCubit>().applicationList;
            return TabBarView(
              dragStartBehavior: DragStartBehavior.start,
              controller: tabController,
              children: [
                generalList.isNotEmpty
                    ? ListView(
                        children: [
                          for (int index = 0;
                              index < generalList.length;
                              index++)
                            Builder(
                              builder: (context) {
                                return GeneralTileWidget(
                                  onTap: () {
                                    context
                                        .read<NotificationCubit>()
                                        .addToRead(index);
                                  },
                                  isCollapsed: generalList[index].isCollapsed,
                                  title: generalList[index].title,
                                  body: generalList[index].body,
                                  time: generalList[index].time,
                                  date: generalList[index].date,
                                  unRead: generalList[index].unRead,
                                );
                              },
                            ),
                        ],
                      )
                    : const NoNotification(
                        padding: EdgeInsets.only(top: 150),
                      ),
                applicationList.isNotEmpty
                    ? _buildNotificationContentTile(applicationList)
                    : const NoNotification(
                        padding: EdgeInsets.only(top: 150),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }

  ListView _buildNotificationContentTile(
      List<ApplicationNotificationModel> appliedJobStatusList) {
    return ListView(
      children: [
        for (int i = 0; i < appliedJobStatusList.length; i++)
          StatusTileWidget(
            status: appliedJobStatusList[i].applicationStatus,
            companyName: appliedJobStatusList[i].companyName,
            title: appliedJobStatusList[i].title,
            onPressed: () {
              context.go(ScreenPath.notificationApplication(
                  appliedJobStatusList[i].jobId.toString()));
            },
          ),
      ],
    );
  }
}
