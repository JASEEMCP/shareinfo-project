import 'package:shareinfo/presentation/core/common_lib.dart';

class Skelton extends StatelessWidget {
  const Skelton(
      {super.key, this.height, this.width, this.borderRadius, this.shape});

  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxShape? shape;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 17,
      width: width ?? 100,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        color: const Color.fromARGB(185, 242, 242, 242),
        borderRadius:
            shape == null ? BorderRadius.circular(borderRadius ?? 2.0) : null,
        //color: context.theme.onshareinfoGreyLite,
      ),
    );
  }
}

class JobCardSkelton extends StatelessWidget {
  const JobCardSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(inset.xl),
        border: Border.all(
          color: context.theme.shareinfoGreyLite,
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              //Company name
              Padding(
                padding: EdgeInsets.only(
                  top: inset.md,
                  left: 70 + inset.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Skelton(),
                    Gap(inset.xs),
                    const Skelton(width: 60),
                  ],
                ),
              ),

              //Company logo and book mark
              Padding(
                padding: EdgeInsets.only(
                  top: inset.md,
                  left: 18,
                  right: 5,
                ),
                child: const Skelton(
                  height: 40,
                  width: 40,
                  borderRadius: 10,
                ),
              ),

              //Divider
              Padding(
                padding: EdgeInsets.only(top: 68 + inset.xs),
                child: Divider(
                  color: context.theme.shareinfoGreyLite,
                  endIndent: 18,
                  indent: 18,
                ),
              ),

              //Company description
              Padding(
                padding: EdgeInsets.only(
                  top: 80,
                  left: 70 + inset.sm,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(inset.xs + 10),
                    Skelton(
                      width: 40 * context.w,
                    ),
                    Gap(inset.xs),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Row(
                        children: [
                          const Expanded(child: Skelton()),
                          Gap(inset.sm),
                          const Expanded(child: Skelton()),
                        ],
                      ),
                    ),
                    Gap(inset.xs),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          const Expanded(child: Skelton()),
                          Gap(inset.sm),
                          const Expanded(child: Skelton()),
                        ],
                      ),
                    ),
                    Gap(inset.md),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ApplicationListTileSkelton extends StatelessWidget {
  const ApplicationListTileSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Padding(
      padding: EdgeInsets.only(bottom: inset.xs),
      child: Column(
        children: [
          Stack(
            children: [
              //Company name
              Padding(
                padding: EdgeInsets.only(
                  top: 5 * context.w,
                  left: 20 * context.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Skelton(),
                    Gap(inset.xs),
                    const Skelton(width: 60),
                  ],
                ),
              ),

              //Company logo and book mark
              Padding(
                padding: EdgeInsets.only(
                  top: 5 * context.w,
                  left: 5 * context.w,
                  right: 3 * context.w,
                ),
                child: const Skelton(
                  height: 40,
                  width: 40,
                  borderRadius: 10,
                ),
              ),

              //Divider
              Padding(
                padding: EdgeInsets.only(
                  top: 18 * context.w,
                ),
                child: Divider(
                  color: context.theme.shareinfoGreyLite,
                  endIndent: 5 * context.w,
                  indent: 5 * context.w,
                ),
              ),

              //Company description
              Padding(
                padding: EdgeInsets.only(
                  top: 21 * context.w,
                  left: 20 * context.w,
                  right: 5 * context.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(inset.xs),
                    Skelton(
                      width: 40 * context.w,
                    ),
                    Gap(inset.xs),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Row(
                        children: [
                          const Expanded(child: Skelton()),
                          Gap(inset.sm),
                          const Expanded(child: Skelton()),
                        ],
                      ),
                    ),
                    Gap(inset.xs),
                    Padding(
                      padding: EdgeInsets.only(right: 6 * context.w),
                      child: Row(
                        children: [
                          const Expanded(child: Skelton()),
                          Gap(inset.sm),
                          const Expanded(child: Skelton()),
                        ],
                      ),
                    ),
                    Gap(inset.xs),
                    const Skelton(width: 120),
                    Gap(inset.xs),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: context.theme.shareinfoGreyLite,
          ),
        ],
      ),
    );
  }
}

class ProfileTileSkelton extends StatelessWidget {
  const ProfileTileSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final insets = $style.insets;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.shareinfoGreyLite),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: insets.sm,
              vertical: insets.xxs,
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Skelton(
                    height: 30,
                    width: 30,
                    shape: BoxShape.circle,
                  ),
                ),
                Gap(insets.sm),
                Expanded(
                  child: Skelton(
                    width: 50 * context.w,
                  ),
                ),
                Gap(insets.offset)
              ],
            ),
          ),
          Divider(
            color: context.theme.shareinfoGreyLite,
            endIndent: insets.sm,
            indent: insets.sm,
          ),
          // body of the container
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: insets.sm,
              vertical: insets.sm,
            ),
            child: Wrap(
              direction: Axis.vertical,
              spacing: insets.sm,
              children: const [
                Skelton(width: 140),
                Skelton(width: 180),
                Skelton(width: 110),
                Skelton(width: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
