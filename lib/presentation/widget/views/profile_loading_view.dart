import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/widget/views/shimmer_animation.dart';
import 'package:shareinfo/presentation/widget/views/skelton.dart';

class ProfileLoadingView extends StatelessWidget {
  const ProfileLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final insets = $style.insets;
    return ShimmerEffect(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: insets.md,
            right: insets.md,
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Skelton(
                            height: 35,
                            width: 35,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Gap(insets.xs),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Skelton(
                              height: 10,
                              width: 120,
                            ),
                            Gap(insets.xs),
                            const Skelton(height: 10),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromARGB(185, 242, 242, 242),
                    )
                  ],
                ),
                Gap(insets.sm),
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: insets.xs),
                    child: const ProfileTileSkelton(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
