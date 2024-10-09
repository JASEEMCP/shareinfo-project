import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

Future openWeb(String? url) async {
  if (url == null) return;
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
  }
  // ignore: empty_catches
  catch (e) {}
}

Future openPlayStore() async {
  try {
    await launchUrl(
      Uri.parse(
          'https://play.google.com/store/apps/details?id=com.imiot.shareinfo'),
      mode: LaunchMode.platformDefault,
    );
  }
  // ignore: empty_catches
  catch (e) {}
}

Future shareInviteLink() async {
  try {
    await Share.share(
        """Let's find Interesting Geeks on ShareInfo! Simple, Modern and Secure app which is designed exclusively for tech aspirants. Get it at ${Env().domainBaseUrl}dl/""");
  }
  // ignore: empty_catches
  catch (e) {}
}

Future shareJobLink(String jobId) async {
  await Share.share(
      'I found an interesting geek on ShareInfo. Check it out and apply:${Env().domainBaseUrl}job/detail/$jobId');
}

Future shareHappeningLink(String eventId) async {
  await Share.share(
      'I found an interesting Event on ShareInfo Happenings. Check it out and Book Your Slot for Free:${Env().domainBaseUrl}happenings/happening_detail/$eventId');
}

Future shareFeedLink() async {
  await Share.share(
      'I found an interesting Article on ShareInfo Feeds. Read Now at ${Env().domainBaseUrl}home/feeds/');
}

Future<void> launchEmail(String mail) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: mail,
    query:
        'subject=#Urgent Query on [Job Title] Application; ShareInfo&body=Dear Recruiter,\n[Describe Your Query]',
  );

  await launchUrl(emailLaunchUri);
}

Future<void> contactUs() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'accountsupport@shareinfo.io',
    query:
        'subject=%23Urgent%2C%20Sign-up%20Error%3B%20ShareInfo%20for%20Aspirants&body=Hey%20Support%20Team%2C%0A%0A%7BEstablish%20Your%20Issue%20Here%7D',
  );
  await launchUrl(emailLaunchUri);
}
