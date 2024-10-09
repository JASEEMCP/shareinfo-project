import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenThirdOnboard extends StatelessWidget {
  const ScreenThirdOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Semantics(
        image: true,
        readOnly: true,
        label: 'Third onboard screen',
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
                            "assets/gif/onboard2.gif",
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
                                  "assets/images/onboard_bg3.png",
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
