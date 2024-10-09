import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/style/responsiveness.dart';
import 'package:shareinfo/presentation/widget/views/shimmer_animation.dart';
import 'package:shareinfo/presentation/widget/views/skelton.dart';

class ApplicationListTileView extends StatelessWidget {
  const ApplicationListTileView({super.key});

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
                for (int i = 0; i < 10; i++) const ApplicationListTileSkelton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobListLoadingView extends StatelessWidget {
  const JobListLoadingView({super.key});

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
                Padding(
                  padding: EdgeInsets.only(bottom: inset.sm),
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                            ? 1
                            : (context.w * 100) ~/ 300,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent:
                            ResponsiveWidget.isSmallScreen(context) ? 195 : 205,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const JobCardSkelton();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventListLoading extends StatelessWidget {
  const EventListLoading({super.key});

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
                Padding(
                  padding: EdgeInsets.only(bottom: inset.sm),
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                          ? 1
                          : (context.w * 100) ~/ 300,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent:
                          ResponsiveWidget.isSmallScreen(context) ? 280 : 280,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(inset.md),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 + inset.sm),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: context.w * 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Skelton(
                                height: 130,
                                width: context.w * 100,
                                borderRadius: 15,
                              ),
                            ),
                            Gap(inset.xs),
                            const Skelton(width: 200, height: 15),
                            Gap(inset.xs),
                            Row(
                              children: [
                                /// Organizer picture
                                const Skelton(
                                  width: 35,
                                  height: 35,
                                  shape: BoxShape.circle,
                                ),
                                Gap(inset.xxs),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Skelton(width: 100, height: 15),
                                    Gap(inset.xxs),
                                    const Skelton(width: 140, height: 15),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
