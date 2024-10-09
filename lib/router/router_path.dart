import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/profile_path.dart';
import 'package:shareinfo/core/settings_path.dart';
import 'package:shareinfo/presentation/root_widget.dart';

class ScreenPath {
  ///Initial paths
  static String splash = "/";
  static String intro = '/intro';
  static String login = '/login';
  static String signUp = '/sign_up';
  static String redirect = '/redirect';
  static String dashboard = '/dashboard';

  ///Navbar tab path
  static String home = '/home';
  static String jobs = '/job';
  static String profile = '/profile';
  static String happening = '/happenings';
  static String practice = '/practice';
  static String savedHappening = '$happening/saved_happening';
  static String searchHappening = '$happening/search_happening';

  static String settings = '$profile/settings';
  static String jobType(JobType type) => _appendJobPath(type, jobs);
  static String homeJobType(JobType type) => _appendJobPath(type, home);
  static String jobDetail(JobType type, String jobId) =>
      _appendJobDetail(type, jobs, jobId);
  static String homeJobDetail(JobType type, String jobId) =>
      _appendJobDetail(type, home, jobId);

  ///Sub routes
  static String homeSearch = '$home/search';
  static String notification = '$home/notification';
  static String feeds = '$home/feeds';
  static String chat = '$home/chat';

  ///This will use to replace previous page after completing  screen [ScreenCreatePassword]
  ////login/verify_otp/confirm_password --> /login/candidate_status
  static String appendWithSignUp = '$login/candidate_status';

  ///Nested page path
  static String deactivate() =>
      _appendIdIntoCurrentPath('/deactivate_submission');
  static String happeningPreview(String eventId) =>
      _appendIdIntoCurrentPath('/happening_preview/$eventId');
  static String happeningFeedback(String eventId) =>
      _appendIdIntoCurrentPath('/happening_feedback/$eventId');
  static String feedbackSuccess(String eventId) =>
      _appendIdIntoCurrentPath('feedback_success/$eventId');

  /// Practice screen sub routes
  static String practiceDetail(String id) => _appendIdIntoCurrentPath('/d/$id');
  static String myChallenges() => _appendIdIntoCurrentPath('/challenges');
  static String leaderboards() => _appendIdIntoCurrentPath('/leaderboards');
  static String challengeDetail(String id, String practiceName) =>
      _appendIdIntoCurrentPath('/d/$id?p=$practiceName');
  static String faqLeaderboards() => _appendIdIntoCurrentPath('/faq');
   static String practiceLeaderboards() => _appendIdIntoCurrentPath('/l');

  /// Happening sub routes
  static String happeningDetail(String eventId) =>
      _appendIdIntoCurrentPath('/happening_detail/$eventId');

  static String forgotPassword() =>
      _appendIdIntoCurrentPath('/forgot_password');
  static String verifyOtp() => _appendIdIntoCurrentPath('/verify_otp');
  static String verifyContact() => _appendIdIntoCurrentPath('/verify_contact');
  static String candidateStatus() =>
      _appendIdIntoCurrentPath('/candidate_status');
  static String confirmationPassword() =>
      _appendIdIntoCurrentPath('/confirm_password');
  static String expertise() => _appendIdIntoCurrentPath('/expertise');
  static String studentVerification() =>
      _appendIdIntoCurrentPath('/student_verification');
  static String aspirations() => _appendIdIntoCurrentPath('/aspirations');
  static String institute() => _appendIdIntoCurrentPath('/institute');
  static String changePassword = '$settings/security/change_password';

  ///Creating path with its enum type
  static String applyProfile(String path) => '$path/a';

  static String applicationStatusDetail(String jobId) =>
      _appendIdIntoCurrentPath('/detail/$jobId/s/$jobId');

  static String application = '$jobs/job_application';

  static String applicationStatus(String jobId) => '$application/s/$jobId';

  static String notificationApplication(String jobId) =>
      '$notification/s/$jobId';

  static String deactivateApplication(String jobId) =>
      '$settings/deactivate_account/s/$jobId';

  ///Profile path with and without id
  static String profilePath(ProfilePath path) => _appendIdIntoCurrentPath(
      parcEnumToProfilePath(path).replaceAll('d/', ''));

  /// Profile screen widget
  static String profilePathWithId(
    ProfilePath path,
    int id,
  ) =>
      _appendIdIntoCurrentPath("${parcEnumToProfilePath(path)}/$id");

  //Settings path
  static String settingsPath(SettingPath path) =>
      "$settings${returnSettingPath(path)}";

  ///Generating job path based on type
  static _appendJobPath(JobType type, String shellName) {
    switch (type) {
      case JobType.campusJobs:
        return '$shellName/campus_jobs';
      case JobType.savedJobs:
        return '$shellName/saved_jobs';
      case JobType.suggestedJobs:
        return '$shellName/suggested_jobs';
      case JobType.search:
        return '$shellName/search_job';
      default:
        return shellName;
    }
  }

  ///Generating job detail path based on type
  static _appendJobDetail(JobType type, String shellName, String jobId) {
    switch (type) {
      case JobType.campusJobs:
        return '$shellName/campus_jobs/detail/$jobId';
      case JobType.savedJobs:
        return '$shellName/saved_jobs/detail/$jobId';
      case JobType.suggestedJobs:
        return '$shellName/suggested_jobs/detail/$jobId';
      case JobType.search:
        return '$shellName/search_job/detail/$jobId';
      default:
        return '$shellName/detail/$jobId';
    }
  }

  ///Appending path
  static _appendIdIntoCurrentPath(String path) {
    final newPathUri = Uri.parse(path);

    final currentPathUri = appRouter.routeInformationProvider.value.uri;
    Map<String, dynamic> parm = Map.of(currentPathUri.queryParameters);
    parm.addAll(newPathUri.queryParameters);
    Uri? loc = Uri(
        path: '${currentPathUri.path}/${newPathUri.path}'.replaceAll('//', '/'),
        queryParameters: parm);
    final newPath = path.replaceAll('/', '');
    return loc.toString().replaceAll('$newPath/$newPath', newPath);
  }
}
