part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.reloadNotification({
    required List<GeneralNotificationModel> generalList,
    required List<ApplicationNotificationModel> applicationList,
  }) = _ReloadNotification;
}

class GeneralNotificationModel {
  String? title;
  String? body;
  String? time;
  String? date;
  bool unRead;
  bool isCollapsed;
  String? messageId;
  GeneralNotificationModel(
      {this.body,
      this.date,
      this.time,
      this.title,
      this.messageId,
      this.unRead = true,
      this.isCollapsed = false});
}

class ApplicationNotificationModel {
  String? title;
  String? companyName;
  String? applicationStatus;
  String? jobId;
  ApplicationNotificationModel(
      {this.title, this.companyName, this.applicationStatus, this.jobId});
}
