import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenFirstOnboard extends StatelessWidget {
  const ScreenFirstOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.shareinfoWhite,
      body: Semantics(
        image: true,
        readOnly: true,
        label: 'First onboard screen',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Stack(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: 70 * context.h,
                              maxWidth: 100 * context.w),
                          child: Image.asset(
                            "assets/gif/onboard1.gif",
                            height: 70 * context.h,
                            width: 100 * context.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Transform.scale(
                          scaleX: 1,
                          scaleY: 1.1,
                          child: Container(
                            height: 70 * context.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/onboard_bg1.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
