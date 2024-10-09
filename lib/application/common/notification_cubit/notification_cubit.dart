import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shareinfo/infrastructure/service_libs.dart';

part 'notification_state.dart';

part 'notification_cubit.freezed.dart';

@lazySingleton
class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState.initial());

  List<GeneralNotificationModel> generalList = [];
  List<ApplicationNotificationModel> applicationList = [];
  List<ValueNotifier> expandedTextNotifier = [];

  void addToRead(int index) {
    generalList[index].unRead = false;
    generalList[index].isCollapsed = !generalList[index].isCollapsed;
    emit(const NotificationState.initial());
    emit(
      NotificationState.reloadNotification(
        generalList: generalList,
        applicationList: applicationList,
      ),
    );
  }

//Add general data to list
  void addGeneralNotification(GeneralNotificationModel generalModel) {
    for (var msg in generalList) {
      if (msg.messageId == generalModel.messageId) {
        return;
      }
    }
    generalList.insert(0, generalModel);
    emit(const NotificationState.initial());
    emit(
      NotificationState.reloadNotification(
        generalList: generalList,
        applicationList: applicationList,
      ),
    );
  }

//Add applied job list
  void addAppliedNotification(ApplicationNotificationModel appliedModel) {
    for (int i = 0; i < applicationList.length; i++) {
      if (applicationList[i].jobId == appliedModel.jobId) {
        applicationList.removeAt(i);
        break;
      }
    }
    applicationList.insert(0, appliedModel);
    emit(const NotificationState.initial());
    emit(
      NotificationState.reloadNotification(
        generalList: generalList,
        applicationList: applicationList,
      ),
    );
  }

  /// Initializing active notification in background
  Future<void> initializeNotificationStorage() async {
    const pref = FlutterSecureStorage();
    final jsonString = await pref.read(key: 'notification');

    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      final generalListX = jsonMap['general'] ?? [];

      final nonGeneralList = jsonMap['non_general'] ?? [];
      final List<GeneralNotificationModel> generalMessages =
          (generalListX as List)
              .map((json) => GeneralNotificationModel(
                    body: json['body'],
                    time: json['time'],
                    date: json['date'],
                    title: json['title'],
                  ))
              .toList();

      final List<ApplicationNotificationModel> nonGeneralMessages =
          (nonGeneralList as List)
              .map(
                (json) => ApplicationNotificationModel(
                  applicationStatus: json['applicationStatus'],
                  title: json['title'],
                  jobId: json['jobId'],
                  companyName: json['companyName'],
                ),
              )
              .toList();
      for (int i = 0; i < generalMessages.length; i++) {
        final message = generalMessages[i];
        for (int k = 0; k < generalList.length; k++) {
          if (generalList[k].messageId == message.messageId) {
            generalList.removeAt(k);
            break;
          }
        }
        generalList.insert(0, message);
      }

      for (int i = 0; i < nonGeneralMessages.length; i++) {
        final message = nonGeneralMessages[i];
        //Preventing notification has same job id
        for (int k = 0; k < applicationList.length; k++) {
          if (applicationList[k].jobId == message.jobId) {
            applicationList.removeAt(k);
            break;
          }
        }
        applicationList.insert(0, message);
      }
    }
    emit(const NotificationState.initial());
    return emit(
      NotificationState.reloadNotification(
        generalList: generalList,
        applicationList: applicationList,
      ),
    );
  }

  /// Clearing temporary stored notification
  Future<void> clearNotification() async {
    const pref = FlutterSecureStorage();
    pref.delete(key: 'notification');
  }
}
