import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/router/router.dart';
import 'package:shareinfo/router/router_path.dart';

@LazySingleton()
class AppLogic {
  ///This used for redirecting
  bool isBootStrapComplete = false;

  Future<void> bootstrap() async {
    try {
      /// Initializing Setting logic
      await settingsLogic.load();

      /// Auth logic
      await auth.load();
      // Update SAS token if token is expire
      updatingSASToken();

      /// Initializing token state
      tokenCubit.initTokenState();

      ///Flagging bootstrap
      isBootStrapComplete = true;

      bool showOnboardScreen =
          settingsLogic.hasCompletedOnboarding.value == false;
      if (showOnboardScreen) {
        return appRouter.go(ScreenPath.intro);
      } else {
        /// Redirecting url with respect the initial link and handle deep link
        /// if  user is enter  refresh button while creating pre-profile stage
        final destination = (auth.authInfo.value.isProfileCreated ?? true)
            ? initialDeepLink ?? ScreenPath.login
            : ScreenPath.login;
        appRouter.go(destination);
      }
    } catch (e) {
      tokenCubit.clearAppData();
      appRouter.go(ScreenPath.login);
    }
  }
}
