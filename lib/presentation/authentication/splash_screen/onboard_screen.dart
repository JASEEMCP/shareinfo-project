import 'package:shareinfo/presentation/authentication/splash_screen/first_onboard_screen.dart';
import 'package:shareinfo/presentation/authentication/splash_screen/second_onboard_screen.dart';
import 'package:shareinfo/presentation/authentication/splash_screen/third_onboard_screen.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenOnboard extends StatefulWidget {
  const ScreenOnboard({super.key});

  @override
  State<ScreenOnboard> createState() => _ScreenOnboardState();
}

class _ScreenOnboardState extends State<ScreenOnboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  TabAnimationPosition position = TabAnimationPosition(0, 0, 0);
  int index = 0;
  double shortWidth = (1 / 170);
  @override
  void initState() {
    super.initState();
    // shortWidth = (1 / 50*context.w);
    position = TabAnimationPosition(-shortWidth * 35, 0, shortWidth * 30);

    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
      animationDuration: const Duration(
        seconds: 1,
      ),
    );

    _tabController.addListener(
      () {
        index = _tabController.index;
        if (_tabController.index == 0) {
          position = TabAnimationPosition(-shortWidth * 35, 0, shortWidth * 30);
        } else if (_tabController.index == 1) {
          position = TabAnimationPosition(
            -shortWidth * 2.5,
            -shortWidth * 35,
            shortWidth * 30,
          );
        }
        if (_tabController.index == 2) {
          position = TabAnimationPosition(
            shortWidth * 27.5,
            -35 * shortWidth,
            shortWidth * -5,
          );
        }
        setState(() {});
      },
    );
  }

  @override
  void didChangeDependencies() {
    //shortWidth = (1 / 50*context.w);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    //final shortWidth = (1 / 50.w);
    //shortWidth = (1 / 100 * context.w);

    return Scaffold(
      body: Stack(
        children: [
          Semantics(
            slider: true,
            image: true,
            readOnly: true,
            label: 'Onboard screens',
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      ScreenFirstOnboard(),
                      ScreenSecondOnboard(),
                      ScreenThirdOnboard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: 100 * context.w,
              decoration: BoxDecoration(
                color: context.theme.shareinfoWhite,
                border: Border.all(color: context.theme.shareinfoGreyLite),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(inset.offset + 10),
                  topRight: Radius.circular(inset.offset + 10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: inset.sm, right: inset.sm, top: inset.xxl),
                child: Column(
                  children: [
                    _buildOnboardContent(context, index),
                    SizedBox(
                      height: inset.offset,
                      child: Stack(
                        children: [
                          AnimatedTabControlWidget(
                            position: position.c1Position as double,
                            color: context.theme.shareinfoMidBlue,
                          ),
                          AnimatedTabControlWidget(
                              position: position.c2Position as double),
                          AnimatedTabControlWidget(
                              position: position.c3Position as double),
                        ],
                      ),
                    ),
                    Semantics(
                      button: true,
                      label: 'Button to slide onboard screen',
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: inset.sm,
                          right: inset.sm,
                          bottom: inset.sm,
                        ),
                        child: CustomElevatedButton(
                          backgroundColor: context.theme.shareinfoMidBlue,
                          buttonName: index == 2 ? 'Get Started' : "Next",
                          width: ElevatedButtonWidth.large,
                          onPressed: () {
                            if (index >= 2) {
                              context.go(ScreenPath.login);
                              settingsLogic.hasCompletedOnboarding.value = true;
                              return;
                            }
                            _tabController.animateTo(++index);
                            if (index == 1) {
                              position = TabAnimationPosition(
                                -shortWidth * 2.5,
                                -shortWidth * 35,
                                shortWidth * 30,
                              );
                            }
                            if (index == 2) {
                              position = TabAnimationPosition(
                                shortWidth * 27.5,
                                -35 * shortWidth,
                                shortWidth * -5,
                              );
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildOnboardContent(BuildContext context, int index) {
    return Column(
      children: [
        Text(
          "${onBoardContent[index]['title']}",
          textScaler: const TextScaler.linear(1),
          style: $style.text.textBold26.copyWith(
            color: context.theme.shareinfoMidBlue,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "${onBoardContent[index]['desc']}",
          textScaler: const TextScaler.linear(1),
          maxLines: 3,
          style: $style.text.textBold14.copyWith(
            color: context.theme.shareinfoGrey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

List<Map<String, String>> onBoardContent = [
  {
    'title': 'We are the best job\nportal platform',
    'desc':
        '"Unlock your career potential with us – the ultimate job portal platform that connects you with top opportunities, paving the way to your dream career."'
  },
  {
    'title': 'The place where\nwork finds you',
    'desc':
        '"Where passion meets profession, and opportunity finds you. Welcome to the place where your dream job comes knocking at your door."'
  },
  {
    'title': "Let's start your\ncareer with us now!",
    'desc':
        '"Embark on Your Career Journey Today! Join Us to Unlock a World of Opportunities and Achieve Your Professional Dreams. Start Now!"'
  }
];

class AnimatedTabControlWidget extends StatelessWidget {
  const AnimatedTabControlWidget({
    super.key,
    required this.position,
    this.color,
  });

  final double position;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment(position, 0),
      duration: const Duration(milliseconds: 1000),
      child: SizedBox(
        width: color != null ? 27 : 21,
        height: 5,
        child: Container(
          decoration: ShapeDecoration(
            color: color ?? context.theme.shareinfoGreyLite,
            shape: const StadiumBorder(),
          ),
        ),
      ),
    );
  }
}

class TabAnimationPosition {
  final double? c1Position;
  final double? c2Position;
  final double? c3Position;

  TabAnimationPosition(this.c1Position, this.c2Position, this.c3Position);
}
