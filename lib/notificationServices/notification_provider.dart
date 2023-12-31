

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:well_done/Foes/Add_Foe.dart';
import 'package:well_done/Foes/reScheduleFoe.dart';
import 'package:well_done/Targets/TargetListView.dart';
import 'package:well_done/Targets/notificationSchedule.dart';
import 'package:well_done/notificationServices/timeprovider.dart';

import '../Friends/Add_Friends.dart';
import '../Targets/Add_target.dart';
import '../main.dart';


class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [

        NotificationChannel(
          //  channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.green,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          enableVibration: true,
          criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel_group',
          channelGroupName: 'Group 1',
        )
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  /// Use this method to detect when a new notification or a schedule is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  /// Use this method to detect every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  /// Use this method to detect if the user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  /// Use this method to detect when the user taps on a notification or action button
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onActionReceivedMethod');
    if (receivedAction != null) {
      String buttonKey = receivedAction.buttonKeyPressed;

      if (buttonKey == 'Ask Me Later') {
        // Handle navigation to Screen 1
        // You can use your preferred navigation method (e.g., Navigator.push())
        MyApp.navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (_) =>  ScheduleNotification(),
        ));
      } else if (buttonKey == 'Set Notification') {
        // Handle navigation to Screen 2
        MyApp.navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) =>  Add_target(),

          ),


        );}
      else if (buttonKey == 'Set Friends') {
        // Handle navigation to Screen 2
        MyApp.navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) =>  TargetListScreen(),

          ),



        );}
      else if (buttonKey == 'Ask Me Later Friends') {
        // Handle navigation to Screen 2
        MyApp.navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) =>  TargetListScreen(),

          ),



        );}
      else if (buttonKey == 'Set Foe') {
        // Handle navigation to Screen 2
        MyApp.navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) =>  TargetListScreen(),

          ),



        );}
      else if (buttonKey =='Ask Me Later Foe') {
        // Handle navigation to Screen 2
        MyApp.navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) =>  ReScheduleFoe(),

          ),



        );}


      }
    final payload = receivedAction.payload ?? {};
    if (payload["navigate"] == "Target") {
      MyApp.navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) =>  Add_target(),

        ),
      );
    }
    else  if (payload["navigate"] == "Friends") {
      MyApp.navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => Add_target(),

        ),
      );
    }
    else  if (payload["navigate"] == "Foe") {
      MyApp.navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) =>  Add_target(),

        ),
      );
    }
  }

  static Future<void> showNotification({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final int? interval,
    required NotificationWeekAndTime? notificationSchedule
  }) async {
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,

autoDismissible: false,      ),
      actionButtons: actionButtons,

      schedule:scheduled? NotificationCalendar(day:notificationSchedule?.timeOfDay.day ,month: notificationSchedule?.timeOfDay.month,
        // weekday: notificationSchedule.dayOfTheWeek,
        hour: notificationSchedule?.timeOfDay.hour,
        minute: notificationSchedule?.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,

      ):null,
    );
  }

  static Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
  }

}