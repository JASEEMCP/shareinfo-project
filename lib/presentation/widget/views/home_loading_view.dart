import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/style/responsiveness.dart';
import 'package:shareinfo/presentation/widget/views/shimmer_animation.dart';
import 'package:shareinfo/presentation/widget/views/skelton.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return ShimmerEffect(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: inset.md,
            right: inset.md,
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Gap(inset.lg),
                Skelton(
                  height: 55,
                  width: 100 * context.w,
                  borderRadius: inset.sm,
                ),
                Gap(inset.lg),
                Skelton(
                  height: 100,
                  width: 100 * context.w,
                  borderRadius: inset.sm,
                ),
                Gap(inset.md + inset.lg),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skelton(),
                    Skelton(width: 70),
                  ],
                ),
                Gap(inset.lg),
                SizedBox(
                  height: 20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: EdgeInsets.only(left: inset.sm),
                          child: const Skelton(
                            width: 95,
                            borderRadius: 20,
                          ),
                        ),
                    ],
                  ),
                ),
                Gap(inset.lg),
                GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                        ? 1
                        : (context.w * 100) ~/ 300,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent:
                        ResponsiveWidget.isSmallScreen(context) ? 220 : 220,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const JobCardSkelton();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
