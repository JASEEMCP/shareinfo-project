import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/widget/views/shimmer_animation.dart';
import 'package:shareinfo/presentation/widget/views/skelton.dart';

class ApplicationLoadingView extends StatelessWidget {
  const ApplicationLoadingView({super.key});

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
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: inset.lg),
                    child: const JobCardSkelton(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
