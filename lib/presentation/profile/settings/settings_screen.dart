import 'package:package_info_plus/package_info_plus.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shareinfo/application/settings/profile_completion_rate_cubit/profile_completion_rate_cubit.dart';
import 'package:shareinfo/core/provider_libs.dart';

import 'package:shareinfo/core/settings_path.dart';
import 'package:shareinfo/presentation/profile/settings/_setting_model.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shareinfo/presentation/profile/widget/_settings_tile_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';

///This variable is  used to show percentage in setting screen
int? percentage = 0;

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  String versionName = '1.0.0';

  _getVersionName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    versionName = packageInfo.version;
  }

  @override
  void initState() {
    super.initState();
    _getVersionName();
  }

  @override
  Widget build(BuildContext context) {
    final style = $style.text;
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ///calling profile event profile screen appearing
        context.read<ProfileCompletionRateCubit>().getPercentage();
      },
    );

    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: "My Settings",
        enableSuffixIcon: false,
      ),
      body: BlocBuilder<ProfileCompletionRateCubit, ProfileCompletionRateState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: CircularProgressIndicator()),
            error: () => NetWorkError(
              onRefresh: () {
                context.read<ProfileCompletionRateCubit>().getPercentage();
              },
            ),
            success: (rate) {
              percentage = rate;
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: inset.md,
                      right: inset.md,
                      top: inset.md,
                    ),
                    child: Container(
                      width: 100 * context.w,
                      constraints: const BoxConstraints(
                        minHeight: 120,
                        maxHeight: double.infinity,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: inset.sm,
                        horizontal: inset.md,
                      ),
                      decoration: BoxDecoration(
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
                        borderRadius: BorderRadius.circular(inset.lg),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircularPercentIndicator(
                                restartAnimation: true,
                                animationDuration: 2,
                                circularStrokeCap: CircularStrokeCap.round,
                                radius: 30,
                                percent: (percentage ?? 0) / 100,
                                lineWidth: 5,
                                progressColor: context.theme.shareinfoWhite,
                                backgroundColor: Colors.transparent,
                                center: Text(
                                  '$percentage%',
                                  textScaler: const TextScaler.linear(1),
                                  style: style.textBold16.copyWith(
                                    color: context.theme.shareinfoWhite,
                                  ),
                                ),
                              ),
                              Gap(inset.md),
                              Expanded(
                                child: SizedBox(
                                  width: 60 * context.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Profile Completed',
                                        style: style.textBold18.copyWith(
                                          color: context.theme.shareinfoWhite,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        'A Complete Profile Increases the Chances of a recruiter being more interested in recruiting you!',
                                        style: style.textSBold10.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                          color: context.theme.shareinfoWhite,
                                        ),
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(inset.sm),
                  _buildDivider(context),
                  SettingsTileWidget(
                    leadingIcon: const Icon(Icons.remove_red_eye_outlined),
                    text: 'Job Seeking status',
                    onPressed: () {
                      context
                          .go(ScreenPath.settingsPath(SettingPath.jobSeeking));
                    },
                  ),
                  _buildDivider(context),
                  Gap(inset.xs),
                  _buildSettingsSubTitle(context, "Account"),
                  Column(
                    children: [
                      for (var item in SettingsPathModel.accountTileList)
                        SettingsTileWidget(
                          leadingIcon: item.icon,
                          text: item.title,
                          onPressed: () {
                            if (item.path == null) return;
                            context.go(ScreenPath.settingsPath(item.path!));
                          },
                        ),
                    ],
                  ),
                  _buildDivider(context),
                  Gap(inset.xs),
                  _buildSettingsSubTitle(context, "General"),
                  Column(
                    children: [
                      for (var item in SettingsPathModel.generalTileList)
                        SettingsTileWidget(
                          leadingIcon: item.icon,
                          text: item.title,
                          onPressed: () {
                            item.onTap != null ? item.onTap!(context) : () {};
                            if (item.path != null) {
                              context.go(ScreenPath.settingsPath(item.path!));
                            }
                          },
                        ),
                    ],
                  ),
                  _buildDivider(context),
                  Gap(inset.xs),
                  _buildSettingsSubTitle(context, "Action"),
                  Column(
                    children: [
                      for (var item in SettingsPathModel.actionTileList)
                        SettingsTileWidget(
                          leadingIcon: item.icon,
                          text: item.title,
                          onPressed: () {
                            item.onTap!(context) ?? () {};
                          },
                        ),
                    ],
                  ),
                  _buildDivider(context),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () => null,
                        authError: (e) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          showSnackBar(
                            e.errorDescription,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        for (var item
                            in SettingsPathModel.accountConfigTileList)
                          SettingsTileWidget(
                            leadingIcon: item.icon,
                            text: item.title,
                            suffix: Icon(
                              item.trailingIcon,
                              size: $style.insets.sm,
                              color: context.theme.imiotDarkPurple,
                            ),
                            isColorRed: true,
                            onPressed: () {
                              item.onTap != null ? item.onTap!(context) : () {};
                              if (item.path == null) return;
                              context.go(ScreenPath.settingsPath(item.path!));
                            },
                          ),
                      ],
                    ),
                  ),
                  Gap(inset.xs),
                  Padding(
                    padding: EdgeInsets.only(
                      left: inset.md,
                      bottom: inset.md,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'ShareInfo',
                          style: $style.text.textBold26.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff3a0372),
                          ),
                        ),
                        Text(
                          ' v$versionName',
                          style: $style.text.textBold12.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade600,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Padding _buildSettingsSubTitle(BuildContext context, String title) {
    final inset = $style.insets;
    return Padding(
      padding: EdgeInsets.only(
        left: inset.md,
        right: inset.md,
      ),
      child: Text(
        title,
        style: $style.text.textBold14.copyWith(
          color: context.theme.shareinfoBlack,
        ),
      ),
    );
  }

  Divider _buildDivider(BuildContext context) {
    final inset = $style.insets;
    return Divider(
      indent: inset.md,
      endIndent: inset.md,
      color: context.theme.shareinfoGreyLite,
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
