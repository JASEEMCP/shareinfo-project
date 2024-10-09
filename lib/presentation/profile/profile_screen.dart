import 'package:shareinfo/core/profile_path.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/profile/settings/settings_screen.dart';
import 'package:shareinfo/presentation/widget/views/profile_loading_view.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'categorized_profile_items.dart';

//This is profile screen
class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  late ScrollController _scrollController;
  late double _savedScrollPosition;

  void _scrollToPosition(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
    _savedScrollPosition = 0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _refreshScreen(BuildContext context) async {
    _savedScrollPosition = 0;
    context.read<ProfileBloc>().add(const ProfileEvent.refreshProfile());
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;
    var txtColor = context.theme.imiotDarkPurple;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ///calling profile event profile screen appearing
        context
            .read<ProfileBloc>()
            .add(const ProfileEvent.getUserProfileData());
      },
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              ImagePaths.shareInfoLogo,
              height: 30,
              width: 30,
            ),
            Gap($style.insets.xs),
            Text(
              "My Profile",
              style: style.textBold18.copyWith(
                color: txtColor,
              ),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) {
              percentage = context.watch<ProfileBloc>().state.maybeWhen(
                    orElse: () => 0,
                    profileSuccess: (model) => model.profileCompleted,
                  );
              return Padding(
                padding: EdgeInsets.only(right: inset.xxs),
                child: IconButton(
                  onPressed: () async {
                    _savedScrollPosition = 0;

                    return context.go(ScreenPath.settings);
                  },
                  icon: const Icon(Icons.settings),
                ),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _refreshScreen(context),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SafeArea(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  error: (e) => NetWorkError(
                    padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                    onRefresh: () => _refreshScreen(context),
                  ),
                  loadingProfile: () => const ProfileLoadingView(),
                  profileSuccess: (profileData) {
                    //print(profileData.cvResumeSet![0].toJson());
                    if (_savedScrollPosition != 0) {
                      _scrollToPosition(_savedScrollPosition);
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: inset.sm),
                      child: Column(
                        children: [
                          //Profile top view
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                    ),
                                    child: auth.authInfo.value.profilePhoto !=
                                            null
                                        ? Image.network(
                                            profileUrl(),
                                            fit: BoxFit.cover,
                                            height: 50,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Center(
                                                child: Icon(
                                                  Icons.person_2,
                                                  color: Colors.grey.shade600,
                                                ),
                                              );
                                            },
                                            frameBuilder: (context, child,
                                                loadingProgress, s) {
                                              if (loadingProgress == null) {
                                                return Center(
                                                  child: Icon(
                                                    Icons.person_2,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                );
                                              }
                                              return child;
                                            },
                                          )
                                        : Center(
                                            child: Icon(
                                              Icons.person_2,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                  ),
                                  Gap(inset.sm),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          auth.authInfo.value.fullName ??
                                              profileData.email ??
                                              'N/A',
                                          style: style.textSBold16.copyWith(
                                            color: txtColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              ///If current organization and position is null return empty string under username
                                              TextSpan(
                                                text: profileData
                                                                .currentPosition ==
                                                            null ||
                                                        profileData
                                                                .currentOrganization ==
                                                            null
                                                    ? profileData
                                                        .currentPosition
                                                    : "${profileData.currentPosition} at ",
                                                style:
                                                    style.textSBold12.copyWith(
                                                  color: Colors.grey[600],
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                              TextSpan(
                                                text: profileData
                                                        .currentOrganization ??
                                                    '',
                                                style:
                                                    style.textBold12.copyWith(
                                                  color: txtColor,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontFamily: 'Nunito',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _savedScrollPosition = 0;
                                      context.go(
                                        ScreenPath.profilePath(
                                          ProfilePath.candidateProfile,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.app_registration,
                                      color: context.theme.shareinfoLightBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: context.theme.shareinfoGreyLite,
                                endIndent: inset.xxs,
                                indent: inset.xxs,
                              ),
                              Gap(inset.sm),
                            ],
                          ),

                          ///Profile category
                          ///Passing profile data into CategorizedProfileWidget
                          ///to showing user info
                          CategorizedProfileWidget(
                            profileModel: profileData,
                            onTap: () {
                              _savedScrollPosition =
                                  _scrollController.position.pixels;
                            },
                          ),
                          const Gap(40),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
