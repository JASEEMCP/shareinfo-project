// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:intl/intl.dart';
// import 'package:shareinfo/core/provider_libs.dart';
// import 'package:shareinfo/infrastructure/service_libs.dart';
// import 'package:shareinfo/presentation/home/screens/notification_screen.dart';
// import 'package:shareinfo/router/router_path.dart';

// List<GeneralNotificationModel> generalList = [];
// List<ApplicationNotificationModel> nonGeneralList = [];

// class FirebaseApi {
//   static String? fcmToken = 'user.web.fcm.token';
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description:
//         'This channel is used for general and user application status notification',
//     importance: Importance.max,
//   );
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   //Clear notification
//   Future<void> clearNotifications() async {
//     // Cancel all notifications
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }

//   ///Initializing firebase
//   Future<void> initNotification() async {
//     try {
//       await _firebaseMessaging.requestPermission();
//       auth.authInfo.value = auth.authInfo.value.copyWith(fcmToken: fcmToken);
//       //Initializing firebase notification
//       initFirebasePushNotification();
//       //Initializing flutter local notification
//       initFlutterLocalNotifications();
//       //Set value into local storage to determine fcm initialization is completed or not
//       settingsLogic.fcmInitialized.value = true;
//     } catch (e) {
//       settingsLogic.fcmInitialized.value = false;
//     }
//   }

//   Future initFirebasePushNotification() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     //Handling notification when app is  terminated
//     FirebaseMessaging.instance.getInitialMessage().then(
//       (message) {
//         handleMessage(message);
//       },
//     );
//     //Handling in app opened notification
//     FirebaseMessaging.onMessageOpenedApp.listen((message) async {
//       // Navigating different message path
//       handleMessage(message);
//     });
//     //Handling background notification
//     FirebaseMessaging.onBackgroundMessage(handleBackground);
//     //Listen firebase notification and trigger local notification
//     FirebaseMessaging.onMessage.listen(
//       (message) async {
//         final notification = message.notification;
//         handleRemoteMessage(message);
//         // If `onMessage` is triggered with a notification, construct our own
//         // local notification to show to users using the created channel.
//         if (notification != null) {
//           await flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 channelDescription: channel.description,
//                 icon: '@mipmap/ic_launcher',
//               ),
//             ),
//             payload: jsonEncode(message.toMap()),
//           );
//           await Future.delayed(const Duration(seconds: 5));
//           clearNotifications();
//         }
//       },
//     );
//   }

//   Future initFlutterLocalNotifications() async {
//     const iOS = DarwinInitializationSettings();
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const settings = InitializationSettings(android: android, iOS: iOS);
//     await flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         // //Handling flutter notification when user is view the message
//         final String? payload = notificationResponse.payload;
//         if (notificationResponse.payload != null) {
//           final message = RemoteMessage.fromMap(jsonDecode(payload!));
//           handleMessage(message);
//         }
//       },
//     );
//     //Create notification channel
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }

//   String _twoDigits(int n) {
//     if (n >= 10) return "$n";
//     return "0$n";
//   }

//   void handleRemoteMessage(RemoteMessage message) {
//     if (message.data['is_general'] == 'true') {
//       DateTime dateTimeObj = DateTime.parse(message.sentTime.toString());
//       String formattedDate = DateFormat("dd MMM, yyyy").format(dateTimeObj);
//       int hour = dateTimeObj.hour;
//       int minute = dateTimeObj.minute;

//       // Determine AM/PM
//       String period = hour < 12 ? 'AM' : 'PM';

//       // Convert hour to 12-hour format
//       hour = hour % 12;
//       if (hour == 0) hour = 12;

//       // Format hour and minute components
//       String formattedTime =
//           "${_twoDigits(hour)}:${_twoDigits(minute)} $period";

//       final model = GeneralNotificationModel(
//         messageId: message.messageId,
//         title: message.notification?.title,
//         body: message.notification?.body,
//         time: formattedTime,
//         date: formattedDate,
//       );
//       getIt<NotificationCubit>().addGeneralNotification(model);
//     } else {
//       final model = ApplicationNotificationModel(
//         title: message.data['job_title'],
//         applicationStatus: message.data['application_status'],
//         companyName: message.data['company_name'],
//         jobId: message.data['job_id'],
//       );
//       getIt<NotificationCubit>().addAppliedNotification(model);
//     }
//   }
// }

// ///Handling notification
// @pragma('vm:entry-point')
// Future<void> handleMessage(RemoteMessage? message) async {
//   if (message?.notification != null) {
//     if (message?.data['is_general'] == 'true') {
//       tabIndex = 0;
//       return appRouter.go(ScreenPath.notification);
//     }
//     tabIndex = 1;
//     appRouter.go(ScreenPath.notification);
//   }
// }

// List generalMessagesJsonList = [];
// List nonGeneralMessagesJsonList = [];
// //Handling background notification
// @pragma('vm:entry-point')
// Future<void> handleBackground(RemoteMessage message) async {
//   const pref = FlutterSecureStorage();
//   if (message.data['is_general'] == 'true') {
//     GeneralNotificationModel model = handleRemoteMessage(message);
//     generalList.insert(0, model);
//     generalMessagesJsonList = generalList
//         .map((message) => {
//               'title': message.title,
//               'body': message.body,
//               'time': message.time,
//               'date': message.date,
//             })
//         .toList();
//   } else {
//     ApplicationNotificationModel model = handleRemoteMessage(message);
//     nonGeneralList.insert(0, model);
//     nonGeneralMessagesJsonList = nonGeneralList
//         .map((message) => {
//               'title': message.title,
//               'jobId': message.jobId,
//               'applicationStatus': message.applicationStatus,
//               'companyName': message.companyName,
//             })
//         .toList();
//   }

//   final jsonStringList = {
//     'general': generalMessagesJsonList,
//     'non_general': nonGeneralMessagesJsonList,
//   };
//   pref.write(key: 'notification', value: jsonEncode(jsonStringList));
// }

// ///Isolating notification  data part
// dynamic handleRemoteMessage(RemoteMessage message) {
//   dynamic model;
//   if (message.data['is_general'] == 'true') {
//     DateTime dateTimeObj = DateTime.parse(message.sentTime.toString());
//     String formattedDate = DateFormat("dd MMM, yyyy").format(dateTimeObj);
//     int hour = dateTimeObj.hour;
//     int minute = dateTimeObj.minute;

//     // Determine AM/PM
//     String period = hour < 12 ? 'AM' : 'PM';

//     // Convert hour to 12-hour format
//     hour = hour % 12;
//     if (hour == 0) hour = 12;

//     // Format hour and minute components
//     String formattedTime = "${twoDigits(hour)}:${twoDigits(minute)} $period";
//     model = GeneralNotificationModel(
//       messageId: message.messageId,
//       title: message.notification?.title,
//       body: message.notification?.body,
//       time: formattedTime,
//       date: formattedDate,
//     );
//     return model;
//   } else {
//     model = ApplicationNotificationModel(
//       title: message.data['job_title'],
//       applicationStatus: message.data['application_status'],
//       companyName: message.data['company_name'],
//       jobId: message.data['job_id'],
//     );
//     return model;
//   }
// }

// String twoDigits(int n) {
//   if (n >= 10) return "$n";
//   return "0$n";
// }
