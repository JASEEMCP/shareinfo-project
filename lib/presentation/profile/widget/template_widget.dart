import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';
import 'package:shareinfo/presentation/widget/logo_frame_widget.dart';

///Type 1
class ProfileTemplateType1 extends StatelessWidget {
  const ProfileTemplateType1({
    super.key,
    required this.icon,
    required this.data,
  });

  final IconData icon;
  final String? data;
  @override
  Widget build(BuildContext context) {
    final insets = $style.insets;
    return Padding(
      padding: EdgeInsets.only(
        left: insets.xxs,
        right: insets.xxs,
        bottom: insets.sm,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: context.theme.shareinfoTextDark,
          ),
          Gap(insets.sm),
          Expanded(
            child: Text(
              data ?? 'N/A',
              style: $style.text.textSBold14.copyWith(
                color: context.theme.shareinfoTextDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///Type 2
class ProfileTemplateType2 extends StatelessWidget {
  const ProfileTemplateType2({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle3,
    this.onTap,
    this.logoPath,
  });

  final String title;
  final String subtitle;
  final String subtitle1;
  final String subtitle3;
  final Function? onTap;
  final String? logoPath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minVerticalPadding: $style.insets.sm,
      onTap: () {
        onTap == null ? () {} : onTap!();
      },
      title: Text(
        title,
        style: $style.text.textBold14.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: $style.text.textSBold12.copyWith(
              color: context.theme.shareinfoTextDark,
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap($style.insets.xxxs),
          Text(
            subtitle1,
            style: $style.text.textBold8.copyWith(
              color: context.theme.shareinfoTextDark,
            ),
          ),
          Gap($style.insets.xxxs),
        ],
      ),
      leading: LogoFrameWidget(
        imageSize: $style.insets.offset,
        imagePath: logoPath ?? ImagePaths.shareInfoLogo,
      ),
      trailing: Icon(
        Icons.app_registration,
        color: context.theme.shareinfoLightBlue,
      ),
    );
  }
}

///Type 3
class ProfileTemplateType3 extends StatelessWidget {
  const ProfileTemplateType3({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    this.subtitle3,
    this.onTap,
    this.logoPath,
  });

  final String title;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String? subtitle3;
  final Function? onTap;
  final String? logoPath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () {
        onTap == null ? () {} : onTap!();
      },
      title: Text(
        title,
        style: $style.text.textBold12.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subtitle3 != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      textScaler: const TextScaler.linear(1),
                      style: $style.text.textBold10.copyWith(
                        color: context.theme.shareinfoTextDark,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gap($style.insets.xxs),
                    Text(
                      "\u2022",
                      style: $style.text.textBold10,
                    ),
                    Gap($style.insets.xxs),
                    Expanded(
                      child: Text(
                        subtitle3!,
                        textScaler: const TextScaler.linear(1),
                        style: $style.text.textBold10.copyWith(
                          color: context.theme.shareinfoTextDark,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                )
              : Text(
                  subtitle,
                  style: $style.text.textBold10.copyWith(
                    color: context.theme.shareinfoTextDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
          Gap($style.insets.xxxs),
          Text(
            subtitle1,
            style: $style.text.textBold8.copyWith(
              color: context.theme.shareinfoTextDark,
            ),
          ),
          Gap($style.insets.xxs),
          Text(
            subtitle2,
            style: $style.text.textBold8.copyWith(
              color: context.theme.shareinfoTextDark,
            ),
          ),
          Gap($style.insets.xxs),
        ],
      ),
      leading: LogoFrameWidget(
        imageSize: $style.insets.offset,
        imagePath: logoPath ?? ImagePaths.googleLogo,
      ),
      trailing: Icon(
        Icons.app_registration,
        color: context.theme.shareinfoLightBlue,
      ),
    );
  }
}

///Type 4
class ProfileTemplateType4 extends StatelessWidget {
  const ProfileTemplateType4({
    super.key,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.chipText,
    required this.chipIcon,
    this.onTap,
    this.logoPath,
    this.onChipPressed,
  });
  final String title;
  final String subtitle;
  final String text;
  final String chipText;
  final IconData chipIcon;
  final Function? onTap;
  final String? logoPath;
  final Function? onChipPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () {
        onTap == null ? () {} : onTap!();
      },
      leading: LogoFrameWidget(
        imageSize: $style.insets.offset,
        imagePath: logoPath ?? ImagePaths.googleLogo,
      ),
      title: Text(
        title,
        style: $style.text.textBold12.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: $style.text.textBold10.copyWith(
              color: context.theme.shareinfoTextDark,
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap($style.insets.xxxs),
          Text(
            text,
            style: $style.text.textBold8.copyWith(
              color: context.theme.shareinfoTextDark,
            ),
          ),
          Gap($style.insets.xs),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                onChipPressed!() ?? () {};
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: $style.insets.xs),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: context.theme.shareinfoBlue,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      chipText,
                      textScaler: const TextScaler.linear(1),
                      style: $style.text.textBold10,
                    ),
                    Icon(
                      chipIcon,
                      color: context.theme.shareinfoBlue,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.app_registration,
        color: context.theme.shareinfoLightBlue,
      ),
    );
  }
}

///Type 5
class ProfileTemplateType5 extends StatelessWidget {
  const ProfileTemplateType5({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitle1,
    this.onTap,
    this.logoPath,
  });
  final String title;
  final String subtitle;
  final String? subtitle1;
  final Function? onTap;
  final String? logoPath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () {
        onTap == null ? () {} : onTap!();
      },
      title: Text(
        title,
        style: $style.text.textBold12.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              subtitle,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold10.copyWith(
                color: context.theme.shareinfoTextDark,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Gap($style.insets.xxs),
          subtitle1 != null
              ? Expanded(
                  child: Text(
                    '\u2022 ${subtitle1!}',
                    textScaler: const TextScaler.linear(1),
                    style: $style.text.textBold10.copyWith(
                      color: context.theme.shareinfoTextDark,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      leading: LogoFrameWidget(
        imageSize: $style.insets.offset,
        imagePath: logoPath ?? ImagePaths.googleLogo,
      ),
      trailing: Icon(
        Icons.app_registration,
        color: context.theme.shareinfoLightBlue,
      ),
    );
  }
}
