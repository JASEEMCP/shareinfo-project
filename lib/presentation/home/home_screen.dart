import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';

import 'package:shareinfo/presentation/widget/custom_circular_icon_button.dart';
import 'package:shareinfo/presentation/widget/custom_job_card_widget.dart';
import 'package:shareinfo/presentation/widget/views/error_views/not_found.dart';
import 'package:shareinfo/presentation/widget/views/home_loading_view.dart';
import 'package:shareinfo/presentation/widget/views/job_list_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Timer _timer;
  final ValueNotifier<int> carouselIndexNotifier = ValueNotifier(0);
  final _selectedTabNotifier = ValueNotifier<int>(-1);
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 250));
  Timer _startTimer() {
    var timer = Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        carouselIndexNotifier.value = (timer.tick - 1) % 3;
      },
    );
    return timer;
  }

  @override
  void initState() {
    super.initState();
    _timer = _startTimer();
    getIt<HomeCubit>().rollBackToPreviousState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final carouselData = [
    [
      "assets/images/carousel_lady_1.png",
      '''See How You Can Crack a Company,
& How to find Best opportunities..!''',
    ],
    [
      "assets/images/carousel_lady_2.png",
      '''Best Practices for Cracking the First Tier MNC ’s from Institute..!''',
    ],
    [
      "assets/images/carousel_lady_3.png",
      '''New Era of Campus Placements
& How We Assist You in this Era !'''
    ]
  ];
  final tabContent = [
    'Full time',
    'Part time',
    'Internship',
    'Freelance',
  ];

  void _refreshScreen(BuildContext context) async {
    _selectedTabNotifier.value = -1;
    await context.read<HomeCubit>().refreshJobListAndDomain();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<HomeCubit>().retrieveJobListAndDomain();
      },
    );
    return Scaffold(
      //App bar of home screen
      appBar: _buildHomeScreenAppBar(context),
      //Body of home screen
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => _refreshScreen(context),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //Search bar
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      !current.isSuggestionLoading &&
                      !current.isSuggestionEmpty &&
                      !current.isSuggestionError,
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      initialLoading: () => const HomeLoadingView(),
                      error: (e) => NetWorkError(
                        onRefresh: () => _refreshScreen(context),
                      ),
                      initialSuccess: (model) {
                        if (4 < tabContent.length) {
                          // Check if the index is within the bounds of the list
                          tabContent.removeRange(4, tabContent.length);
                        }
                        tabContent.addAll(model.domain ?? []);

                        return Column(
                          children: [
                            //Text field
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: inset.lg,
                                horizontal: inset.sm,
                              ),
                              child: Column(
                                children: [
                                  Hero(
                                    tag: 'txt_field',
                                    child: Material(
                                      child: TextField(
                                        onTap: () {
                                          HapticFeedback.mediumImpact();
                                          context.go(ScreenPath.homeJobType(
                                              JobType.search));
                                        },
                                        readOnly: true,
                                        style: $style.text.textSBold12.copyWith(
                                          color:
                                              context.theme.shareinfoTextDark,
                                        ),
                                        decoration: InputDecoration(
                                          fillColor: const Color(0x59d9d9d9),
                                          filled: true,
                                          isDense: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(inset.sm),
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText:
                                              'Search for a course, job, company, etc',
                                          hintStyle:
                                              $style.text.textSBold12.copyWith(
                                            color:
                                                context.theme.shareinfoTextDark,
                                          ),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            size: inset.lg,
                                            color: context.theme.shareinfoGrey,
                                          ),
                                          suffixIcon: Icon(
                                            Icons.sort,
                                            size: inset.lg,
                                            color: context.theme.shareinfoGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(inset.md),
                                  //Transition  container
                                  ValueListenableBuilder(
                                    valueListenable: carouselIndexNotifier,
                                    builder: (context, index, _) {
                                      return _buildDynamicCarouselWidget(
                                        context,
                                        carouselData[index],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //See more job for suggestion
                            _buildSuggestionHeader(
                              context,
                              title: "Suggestions",
                              buttonName: "See All",
                              onPressed: () {
                                context.go(ScreenPath.homeJobType(
                                    JobType.suggestedJobs));
                              },
                            ),
                            //TabBar view
                            ValueListenableBuilder(
                              valueListenable: _selectedTabNotifier,
                              builder: (context, value, _) {
                                return SizedBox(
                                  height: inset.lg + 1,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: tabContent.length,
                                    padding: EdgeInsets.only(
                                      right: inset.sm,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          left: inset.sm,
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            onTap: () {
                                              HapticFeedback.mediumImpact();
                                              if (index == value) {
                                                context
                                                    .read<HomeCubit>()
                                                    .getSuggestedJobList(
                                                      '',
                                                      -1,
                                                    );
                                                _selectedTabNotifier.value = -1;
                                                return;
                                              }
                                              _selectedTabNotifier.value =
                                                  index;
                                              context
                                                  .read<HomeCubit>()
                                                  .getSuggestedJobList(
                                                    tabContent[index],
                                                    index,
                                                  );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: inset.sm,
                                              ),
                                              decoration: ShapeDecoration(
                                                shape: StadiumBorder(
                                                  side: BorderSide(
                                                    color: context
                                                        .theme.shareinfoGrey,
                                                  ),
                                                ),
                                                color: index == value
                                                    ? context
                                                        .theme.imiotDarkPurple
                                                        .withOpacity(0.8)
                                                    : Colors.transparent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  tabContent[index],
                                                  textScaler:
                                                      const TextScaler.linear(
                                                          1),
                                                  style: $style.text.textBold10
                                                      .copyWith(
                                                    color: index == value
                                                        ? context.theme
                                                            .shareinfoWhite
                                                        : context.theme
                                                            .imiotDarkPurple,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            //Job card vertical listView
                          ],
                        );
                      },
                    );
                  },
                ),
                //Suggestion job list
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      suggestionError: (e) => NetWorkError(
                        padding: EdgeInsets.zero,
                        onRefresh: () {
                          context.read<HomeCubit>().getSuggestedJobList('', -1);
                          _selectedTabNotifier.value = -1;
                        },
                      ),
                      suggestionEmpty: () => NotFound(
                        onRefresh: () {
                          ///Refresh job
                          context.read<HomeCubit>().getSuggestedJobList('', -1);
                          _selectedTabNotifier.value = -1;
                        },
                        padding: EdgeInsets.zero,
                      ),
                      orElse: () => const SizedBox.shrink(),
                      loading: () => const JobListLoadingView(),
                      initialSuccess: (model) {
                        if (model.jobList!.isEmpty) {
                          return NotFound(
                            onRefresh: () {
                              ///Refresh job
                              context
                                  .read<HomeCubit>()
                                  .getSuggestedJobList('', -1);
                              _selectedTabNotifier.value = -1;
                            },
                            padding: EdgeInsets.zero,
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: inset.lg,
                            horizontal: inset.sm,
                          ),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  ResponsiveWidget.isSmallScreen(context)
                                      ? 1
                                      : (context.w * 100) ~/ 300,
                              crossAxisSpacing: 10,
                              mainAxisExtent:
                                  ResponsiveWidget.isSmallScreen(context)
                                      ? 195
                                      : 205,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.jobList?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: inset.sm),
                                child: CustomJobCardWidget(
                                  companyLogo:
                                      model.jobList?[index].companyLogo ?? '',
                                  title: model.jobList?[index].jobTitle,
                                  isCampus: model.jobList?[index].isCampus,
                                  subtitle: model.jobList?[index].companyName,
                                  location:
                                      model.jobList![index].location!.isEmpty
                                          ? 'N/A'
                                          : model.jobList?[index].location![0],
                                  description: model
                                              .jobList?[index].salaryType ==
                                          'Onwards'
                                      ? '₹ ${getSalaryToLpa(model.jobList?[index].minimumSalary)} LPA - onwards'
                                      : model.jobList?[index].salaryType ==
                                              'Range'
                                          ? '${getSalaryToLpa(model.jobList?[index].minimumSalary)} LPA to ${getSalaryToLpa(model.jobList?[index].maximumSalary)} LPA'
                                          : '${getSalaryToLpa(model.jobList?[index].minimumSalary)} LPA',
                                  workingMode:
                                      model.jobList?[index].workingMode,
                                  isSaved: model.jobList?[index].isSaved,
                                  onSaved: () {
                                    _debouncer.call(() {
                                      context.read<HomeCubit>().saveJob(
                                          model.jobList?[index].jobId ?? '',
                                          index);
                                    });
                                  },
                                  onPressed: () {
                                    context.go(
                                        '/home/detail/${model.jobList?[index].jobId}');
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String greet() {
  var now = DateTime.now();
  var hour = now.hour;

  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

AppBar _buildHomeScreenAppBar(BuildContext context) {
  final inset = $style.insets;
  final greetMsg = greet();
  return AppBar(
    backgroundColor: context.theme.shareinfoWhite,
    automaticallyImplyLeading: false,
    toolbarHeight: kTextTabBarHeight + 35,
    shape: Border(
      bottom: BorderSide(
        color: context.theme.shareinfoGreyLite,
      ),
    ),
    actions: [
      //Notification icon
      // CircularIconButton(
      //   icon: Icons.notifications_active_outlined,
      //   onPressed: () async {
      //     context.go(ScreenPath.notification);
      //     FirebaseApi().clearNotifications();
      //   },
      // ),
      //chat icon
      CircularIconButton(
        icon: Icons.chat_outlined,
        onPressed: () {
          context.go(ScreenPath.chat);
        },
      ),
      Gap(inset.md),
    ],
    title: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: auth.authInfo.value.profilePhoto != null
              ? Image.network(
                  profileUrl(),
                  fit: BoxFit.cover,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.person_2,
                        color: Colors.grey.shade600,
                      ),
                    );
                  },
                  frameBuilder: (context, child, loadingProgress, s) {
                    if (loadingProgress == null) {
                      return Center(
                        child: Icon(
                          Icons.person_2,
                          color: Colors.grey.shade600,
                        ),
                      );
                    }
                    return child;
                  },
                )
              : Center(
                  child: Icon(
                    Icons.person_2,
                    color: Colors.grey.shade600,
                  ),
                ),
        ),
        Gap(inset.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$greetMsg👋',
                style: $style.text.textN14.copyWith(
                  color: const Color(0xFF7C6691),
                ),
              ),
              Text(
                auth.authInfo.value.fullName ?? 'Aspirant',
                style: $style.text.textBold12.copyWith(
                  color: context.theme.shareinfoBlack,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container _buildDynamicCarouselWidget(BuildContext context, List data) {
  final inset = $style.insets;
  return Container(
    width: context.w * 100,
    padding: EdgeInsets.only(top: inset.md, left: inset.md, right: inset.xs),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(inset.md),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff2b201a),
          Color(0xff8d74a5),
          Color(0xfff23500),
          Color(0xff3a0372),
        ],
      ),
    ),
    child: AnimatedSwitcher(
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      duration: $style.times.slow,
      child: Stack(
        key: UniqueKey(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                data[0],
                fit: BoxFit.cover,
                height: 110,
              ),
            ],
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.7,
            child: Text(
              data[1],
              textScaler: const TextScaler.linear(1),
              maxLines: 3,
              style: $style.text.textBold12.copyWith(
                color: context.theme.shareinfoWhite,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: inset.sm,
            child: ElevatedButton(
              onPressed: () {
                context.go(ScreenPath.feeds);
              },
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(150, 25),
                minimumSize: const Size(100, 25),
                backgroundColor: context.theme.shareinfoWhite,
                shape: const StadiumBorder(),
              ),
              child: Text(
                'Read More',
                textScaler: const TextScaler.linear(1),
                style: $style.text.textBold12.copyWith(
                  color: context.theme.imiotDarkPurple,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Padding _buildSuggestionHeader(BuildContext context,
    {required String title,
    required String buttonName,
    required Function onPressed}) {
  final inset = $style.insets;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: inset.md),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: $style.text.textBold14.copyWith(
              overflow: TextOverflow.ellipsis,
              color: context.theme.imiotDarkPurple,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            buttonName,
            style: $style.text.textBold14.copyWith(
              overflow: TextOverflow.ellipsis,
              color: context.theme.shareinfoMidBlue,
            ),
          ),
        ),
      ],
    ),
  );
}
