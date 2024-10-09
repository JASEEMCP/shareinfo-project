import 'package:shareinfo/presentation/authentication/splash_screen/onboard_screen.dart';
import 'package:shareinfo/presentation/happening/screens/occurred_detail_screen.dart';
import 'package:shareinfo/presentation/practice/practice_screen.dart';
import 'package:shareinfo/presentation/practice/screens/challenge_detail_screen.dart';
import 'package:shareinfo/presentation/practice/screens/faq_leaderboard.dart';
import 'package:shareinfo/presentation/practice/screens/leaderboards_screen.dart';
import 'package:shareinfo/presentation/practice/screens/my_challenges_screen.dart';
import 'package:shareinfo/presentation/practice/screens/practice_detail.dart';
import 'package:shareinfo/presentation/practice/screens/specific_practice_leaderboards_screen.dart';
import 'package:shareinfo/router/auth_paths.dart';
import 'package:shareinfo/router/router_lib.dart';
import 'package:shareinfo/router/router_path.dart';

import '../presentation/happening/screens/event_search_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKry = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: ScreenPath.redirect,
    redirect: _handleRedirect,
    redirectLimit: 10,
    //observers: [GoRouteObserver()],
    errorPageBuilder: (context, state) {
      return CustomTransitionPage(
        transitionsBuilder: useBottomUpTransition,
        key: state.pageKey,
        child: const PageNotFound(),
      );
    },
    navigatorKey: _rootNavigatorKey,
    routes: [
      ///In-App Update screen
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/update',
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            transitionsBuilder: useBottomUpTransition,
            child: UpdateAppScreen(),
          );
        },
      ),

      ///Real time splash builder
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: ScreenPath.redirect,
        builder: (context, state) {
          return const ScreenRealTimeSplash();
        },
      ),

      ///Intro
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: ScreenPath.intro,
        builder: (context, state) {
          return const ScreenOnboard();
        },
      ),

      ///Auth Screen
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: ScreenPath.login,
        builder: (context, state) {
          return const ScreenLogin();
        },

        /// The list have  include all auth route
        routes: authRouter,
      ),

      /// Navigation shell
      ShellRoute(
        navigatorKey: _shellNavigatorKry,
        builder: (context, state, child) {
          return ScreenMain(
            key: state.pageKey,
            child: child,
          );
        },
        routes: [
          /// Home screen shell
          GoRoute(
            redirect: (context, state) {
              tabChangeNotifier.value = 0;
              return null;
            },
            parentNavigatorKey: _shellNavigatorKry,
            path: ScreenPath.home,
            pageBuilder: (context, state) {
              return const CustomTransitionPage(
                transitionsBuilder: useNavChangeTransition,
                child: ScreenHome(),
              );
            },
            routes: [
              //Feeds by shareinfo
              GoRoute(
                path: 'feeds',
                parentNavigatorKey: _rootNavigatorKey,
                redirect: (context, state) {
                  //Change navbar index into 1
                  tabChangeNotifier.value = 0;
                  if (tokenCubit.state.isInitial) {
                    return ScreenPath.login;
                  }

                  return null;
                },
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useBottomUpTransition,
                    child: ScreenShareInfoFeed(),
                  );
                },
              ),
              //Chat shareinfo
              GoRoute(
                path: 'chat',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useBottomUpTransition,
                    child: const ChatScreen(),
                  );
                },
              ),
              //Notification Screen
              GoRoute(
                path: 'notification',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: ScreenNotifications());
                },
                routes: [
                  GoRoute(
                    path: 's/:jobId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useBottomUpTransition,
                        child: ScreenApplicationStatus(
                            jobId: state.pathParameters['jobId'].toString()),
                      );
                    },
                  ),
                ],
              ),
              //Detail Screen
              GoRoute(
                path: 'detail/:jobId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    transitionsBuilder: useLeftToRightTransition,
                    child: ScreenJobDetail(
                      jobId: state.pathParameters['jobId'].toString(),
                    ),
                  );
                },
                //Profile Screen block
                routes: _categoryRoute,
              ),

              //Home screen default job list
              GoRoute(
                path: ':jobType',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  JobType type = parcStringToJobType(
                      state.pathParameters['jobType'] as String);
                  return jobScreenWithType(type);
                },
                routes: [
                  //navigate job screen based on type
                  GoRoute(
                    path: 'detail/:jobId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenJobDetail(
                          jobId: state.pathParameters['jobId'].toString(),
                        ),
                      );
                    },
                    routes: _categoryRoute,
                  ),
                ],
              ),
            ],
          ),

          /// Practice Screen shell
          GoRoute(
            redirect: (context, state) {
              tabChangeNotifier.value = 1;
              return null;
            },
            parentNavigatorKey: _shellNavigatorKry,
            path: ScreenPath.practice,
            pageBuilder: (context, state) {
              return const CustomTransitionPage(
                transitionsBuilder: useNavChangeTransition,
                child: ScreenPractice(),
              );
            },
            routes: [
              /// Practice detail
              GoRoute(
                path: 'd/:id',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: ScreenPracticeDetail(
                      id: state.pathParameters['id'],
                    ),
                  );
                },
              ),

              ///Leaderboards
              GoRoute(
                path: 'leaderboards',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: const ScreenLeaderboards(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'faq',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: const ScreenFaqLeaderboards(),
                      );
                    },
                  ),
                ],
              ),

              ///Challenges
              GoRoute(
                path: 'challenges',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: const ScreenMyChallenges(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'd/:id',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ChallengeDetailScreen(
                          id: state.pathParameters['id'].toString(),
                          practiceName:
                              state.uri.queryParameters['p'].toString(),
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'l',
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) {
                          return CustomTransitionPage(
                            key: state.pageKey,
                            transitionsBuilder: useLeftToRightTransition,
                            child: ScreenSpecificPracticeLeaderboards(
                              practiceId: state.pathParameters['id'].toString(),
                            ),
                          );
                        },
                        routes: [
                          GoRoute(
                            path: 'faq',
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder: (context, state) {
                              return CustomTransitionPage(
                                key: state.pageKey,
                                transitionsBuilder: useLeftToRightTransition,
                                child: const ScreenFaqLeaderboards(),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          ///Job screen shell
          GoRoute(
            redirect: (context, state) {
              tabChangeNotifier.value = 2;
              return null;
            },
            parentNavigatorKey: _shellNavigatorKry,
            path: ScreenPath.jobs,
            pageBuilder: (context, state) {
              return const CustomTransitionPage(
                transitionsBuilder: useNavChangeTransition,
                child: ScreenJob(),
              );
            },
            routes: [
              //Job detail screen
              GoRoute(
                path: 'detail/:jobId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: ScreenJobDetail(
                      jobId: state.pathParameters['jobId'].toString(),
                    ),
                  );
                },
                routes: _categoryRoute,
              ),

              ///Applied job screen
              GoRoute(
                path: 'job_application',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return const MaterialPage(
                    child: ScreenMyApplications(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 's/:jobId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenApplicationStatus(
                          jobId: state.pathParameters['jobId'].toString(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              //Job screen default
              GoRoute(
                path: ':jobType',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  JobType type = parcStringToJobType(
                      state.pathParameters['jobType'] as String);
                  return jobScreenWithType(type);
                },
                routes: [
                  //Job screen based on type
                  GoRoute(
                    path: 'detail/:jobId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        transitionsBuilder: useLeftToRightTransition,
                        key: state.pageKey,
                        child: ScreenJobDetail(
                          jobId: state.pathParameters['jobId'].toString(),
                        ),
                      );
                    },
                    routes: _categoryRoute,
                  ),
                ],
              ),
            ],
          ),

          /// Happening screen shell
          GoRoute(
            redirect: (context, state) {
              tabChangeNotifier.value = 3;
              return null;
            },
            parentNavigatorKey: _shellNavigatorKry,
            path: ScreenPath.happening,
            pageBuilder: (context, state) {
              return const CustomTransitionPage(
                transitionsBuilder: useNavChangeTransition,
                child: ScreenHappening(),
              );
            },
            routes: [
              GoRoute(
                path: 'happening_preview/:eventId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: ScreenEventPreview(
                      eventId: state.pathParameters['eventId'].toString(),
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'happening_feedback/:eventId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenEventRating(
                          eventId: state.pathParameters['eventId'].toString(),
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: 'feedback_success/:eventId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenFeedBackSuccess(
                          eventId: state.pathParameters['eventId'].toString(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'occurred_detail/:eventId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: ScreenOccurredDetail(
                      eventId: state.pathParameters['eventId'].toString(),
                    ),
                  );
                },
                routes: _happeningRoute,
              ),
              //Events list
              GoRoute(
                path: 'happening_detail/:eventId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: ScreenEventDetail(
                      eventId: state.pathParameters['eventId'].toString(),
                    ),
                  );
                },
                routes: _happeningRoute,
              ),
              //Search happening
              GoRoute(
                path: 'search_happening',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: const ScreenEventSearch(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'occurred_detail/:eventId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenOccurredDetail(
                          eventId: state.pathParameters['eventId'].toString(),
                        ),
                      );
                    },
                    routes: _happeningRoute,
                  ),
                  GoRoute(
                    path: 'happening_detail/:eventId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenEventDetail(
                          eventId: state.pathParameters['eventId'].toString(),
                        ),
                      );
                    },
                    routes: _happeningRoute,
                  ),
                ],
              ),
              // Saved Happening
              GoRoute(
                path: 'saved_happening',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: const ScreenSavedEvents(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'occurred_detail/:eventId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenOccurredDetail(
                          eventId: state.pathParameters['eventId'].toString(),
                        ),
                      );
                    },
                    routes: _happeningRoute,
                  ),
                  GoRoute(
                    path: 'happening_detail/:eventId',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: ScreenEventDetail(
                          eventId: state.pathParameters['eventId'].toString(),
                        ),
                      );
                    },
                    routes: _happeningRoute,
                  ),
                ],
              ),
            ],
          ),

          ///Profile screen shell
          GoRoute(
            redirect: (context, state) {
              tabChangeNotifier.value = 4;
              return null;
            },
            parentNavigatorKey: _shellNavigatorKry,
            path: ScreenPath.profile,
            pageBuilder: (context, state) {
              return const CustomTransitionPage(
                transitionsBuilder: useNavChangeTransition,
                child: ScreenProfile(),
              );
            },
            routes: [
              ///Screen settings
              GoRoute(
                path: 'settings',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: const ScreenSettings(),
                  );
                },
                routes: [
                  ///Navigating setting
                  GoRoute(
                    path: ':settingsPath',
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      SettingPath type = returnSettingEnum(
                          state.pathParameters['settingsPath'] as String);
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionsBuilder: useLeftToRightTransition,
                        child: returnSettingScreen(type),
                      );
                    },
                    routes: [
                      //Deactivation
                      GoRoute(
                        path: 'deactivate_submission',
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) {
                          return CustomTransitionPage(
                            key: state.pageKey,
                            transitionsBuilder: useLeftToRightTransition,
                            child: const ScreenDetectiveSubmission(),
                          );
                        },
                      ),
                      //Password reset
                      GoRoute(
                        path: 'change_password',
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) {
                          return ScreenChangePassword();
                        },
                      ),
                      //Applied job list
                      GoRoute(
                        path: 's/:jobId',
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) {
                          return CustomTransitionPage(
                            key: state.pageKey,
                            transitionsBuilder: useBottomUpTransition,
                            child: ScreenApplicationStatus(
                                jobId:
                                    state.pathParameters['jobId'].toString()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),

              ///Navigating profile with id
              GoRoute(
                path: 'd/:profilePath/:id',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  ProfilePath type = parcStringToProfileEnum(
                      state.pathParameters['profilePath'] as String);
                  int id = int.tryParse(state.pathParameters['id'] ?? '') ?? -1;

                  return MaterialPage(
                    child: parcProfileEnumToScreen(type, id: id),
                  );
                },
              ),

              ///Navigating profile without id
              GoRoute(
                path: ':profilePath',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  ProfilePath type = parcStringToProfileEnum(
                      state.pathParameters['profilePath'] as String);

                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: useLeftToRightTransition,
                    child: parcProfileEnumToScreen(type),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

//The route is use multiple times
  static List<GoRoute> get _categoryRoute => [
        GoRoute(
          path: 's/:jobId',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: useLeftToRightTransition,
              child: ScreenApplicationStatus(
                  jobId: state.pathParameters['jobId'].toString()),
            );
          },
        ),
        GoRoute(
          path: 'detail/:jobId/s/:jobAId',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: useBottomUpTransition,
              child: ScreenApplicationStatus(
                  jobId: state.pathParameters['jobAId'].toString()),
            );
          },
        ),
        GoRoute(
          path: 'a',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ScreenJobApplyWithProfile(),
            );
          },
          routes: [
            ///Navigating profile with id
            GoRoute(
              path: 'd/:profilePath/:id',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                ProfilePath type = parcStringToProfileEnum(
                    state.pathParameters['profilePath'] as String);
                int id = int.tryParse(state.pathParameters['id'] ?? '') ?? -1;

                return parcProfileEnumToScreen(type, id: id);
              },
            ),

            ///Navigating profile without id
            GoRoute(
              path: ':profilePath',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                ProfilePath type = parcStringToProfileEnum(
                    state.pathParameters['profilePath'] as String);

                return parcProfileEnumToScreen(type);
              },
            ),
          ],
        ),
      ];

  static List<GoRoute> get _happeningRoute => [
        GoRoute(
          path: 'happening_preview/:eventId',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: useLeftToRightTransition,
              child: ScreenEventPreview(
                eventId: state.pathParameters['eventId'].toString(),
              ),
            );
          },
        ),
        GoRoute(
          path: 'happening_feedback/:eventId',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: useLeftToRightTransition,
              child: ScreenEventRating(
                eventId: state.pathParameters['eventId'].toString(),
              ),
            );
          },
        ),
        GoRoute(
          path: 'feedback_success/:eventId',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: useLeftToRightTransition,
              child: ScreenFeedBackSuccess(
                eventId: state.pathParameters['eventId'].toString(),
              ),
            );
          },
        ),
      ];

  static Widget useBottomUpTransition(
      context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  static GoRouter get router => _router;
}

Widget useLeftToRightTransition(context, animation, secondaryAnimation, child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}

Widget useNavChangeTransition(context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

// class GoRouteObserver extends NavigatorObserver {

//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     print(previousRoute?.settings.name);
//   }
// }

///Customized go router
class AppRoute extends GoRoute {
  AppRoute(
    String path, {
    List<GoRoute> routes = const [],
    required Widget Function(GoRouterState s) builder,
  }) : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: useLeftToRightTransition,
              child: builder(state),
            );
          },
        );
}

String? get initialDeepLink => _initialDeepLink;
String? _initialDeepLink;
String? _handleRedirect(BuildContext context, GoRouterState state) {
  final init = tokenCubit.state.isInitial;
  final a = appLogic;
  final route = state.uri.path;
  //print(route);

  /// Preventing enter pre-profile screen when user is authenticated
  // if ((auth.authInfo.value.isProfileCreated ?? false) &&
  //     route.contains('candidate_status')) {
  //   return ScreenPath.login;
  // }

  /// Redirecting initial root to login page
  if (route == ScreenPath.splash) {
    return ScreenPath.login;
  }

  /// Initializing deep linking path for redirecting
  if (!appLogic.isBootStrapComplete && route != ScreenPath.redirect) {
    _initialDeepLink ??= state.uri.toString();
    return ScreenPath.redirect;
  }

  /// Preventing user to go redirecting page
  if (appLogic.isBootStrapComplete && route == ScreenPath.redirect) {
    return _initialDeepLink;
  }

  /// Handle root for Unauthenticated user entering app
  if (a.isBootStrapComplete &&
      init &&
      route == _initialDeepLink &&
      !route.contains('login')) {
    return ScreenPath.login;
  }

  /// Handle root for Unauthenticated user entering app
  if (a.isBootStrapComplete &&
      !(auth.authInfo.value.isProfileCreated ?? false) &&
      !route.contains('login') &&
      !route.contains('intro')) {
    if (route.contains('/update') && settingsLogic.update.value) {
      return '/update';
    }
    return ScreenPath.login;
  }

  /// Handle root for Authenticated user
  if (a.isBootStrapComplete &&
      !init &&
      (auth.authInfo.value.isProfileCreated ?? false) &&
      route == ScreenPath.login) {
    return ScreenPath.home;
  }

  // Return by default
  return null;
}
