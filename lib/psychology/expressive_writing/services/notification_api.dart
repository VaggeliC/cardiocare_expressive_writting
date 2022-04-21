// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../model/alarm_info.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();


  final MethodChannel platform =
  MethodChannel('dexterx.dev/example');


  static Future _notificationDetails() async {
  // final sound = 'notification_sound.wav';
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channels', 'Pelvic Reminders',
        channelDescription: 'This is My channels',
        importance: Importance.high,
        priority: Priority.max,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      ),
      //iOS: IOSNotificationDetails(sound: sound),
    );
  }

  static Future showNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  static Future init({bool initScheduled = false}) async {
    // final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final android = AndroidInitializationSettings("flutter_icon");
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    final details = await _notifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }
    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });

    if (initScheduled) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      print(locationName);
      // tz.setLocalLocation(tz.getLocation(locationName));
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future<void> showScheduledNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
    required AlarmInfo alarm,
    required List<int> weekdays,
  }) async =>
      _notifications.zonedSchedule(
          id,
          title,
          body,
          _scheduleWeekly(

               Time(int.parse(alarm.timeOfDay.split(":")[0]),
                   int.parse(alarm.timeOfDay.split(":")[1].split(" ")[0])),
              /*Time(
                  alarm.timeOfDay.contains("AM") ||
                          alarm.timeOfDay.split(":")[0] == '12'
                      ? int.parse(alarm.timeOfDay.split(":")[0])
                      : int.parse(alarm.timeOfDay.split(":")[0]) + 12,
                  int.parse(alarm.timeOfDay.split(":")[1].split(" ")[0])),*/
              days: weekdays),
          // tz.TZDateTime.from(scheduledDate, tz.local),
          await _notificationDetails(),
          payload: payload,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);

    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
  }

  static tz.TZDateTime _scheduleWeekly(Time time, {required List<int> days}) {
    tz.TZDateTime scheduledDate = _scheduleDaily(time);
    while (!days.contains(scheduledDate.weekday)) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<void> cancellAll() async {
    await _notifications.cancelAll();
  }

  static Future<void> cancellNotification(int id) async {
    await _notifications.cancel(id);
  }
}
