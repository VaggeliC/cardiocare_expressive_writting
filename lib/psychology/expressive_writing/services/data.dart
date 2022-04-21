// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_local_variable, unnecessary_null_in_if_null_operators

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/alarm_info.dart';
import 'notification_api.dart';

class Data with ChangeNotifier {
  static late SharedPreferences preferences;
  static const _keyAlarms = 'cardio_remindersss';

  static List<AlarmInfo> _alarms = [];

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
    _alarms = await getAllAllarms();
  }

  int get alarmsCount => _alarms.length;
  List<AlarmInfo> get allAlarms => _alarms;

  void addAlarm(AlarmInfo alarm) async {
    _alarms.add(alarm);
    notifyListeners();
    String json = jsonEncode(_alarms);

    await preferences.setString(_keyAlarms, json);
  }

  void removeAlarm(AlarmInfo alarm) async {
    _alarms.remove(alarm);
    notifyListeners();

    NotificationApi.cancellNotification(alarm.tilte.hashCode);
    String json = jsonEncode(_alarms);

    await preferences.setString(_keyAlarms, json);
  }

  static Future<List<AlarmInfo>> getAllAllarms() async {
    String? json = await preferences.getString(_keyAlarms);
    final List<dynamic> alarmss = json != null ? jsonDecode(json) : [];

    return alarmss
        .map<AlarmInfo>((alarm) => AlarmInfo.fromJson(alarm))
        .toList();
  }

  void changeState(AlarmInfo alarm, int index) async {
    alarm.toggleDone();
    notifyListeners();
    String json = jsonEncode(_alarms);
    await preferences.setString(_keyAlarms, json);
  }

  void changeWeekday(AlarmInfo alarm, int index, int tile) async {
    List<int> weekdays = [];
    alarm.values[index] = alarm.values[index] == "true" ? "false" : "true";
    notifyListeners();
    for (int i = 0; i < 7; i++) {
      if (alarm.values[i] == "true") {
        if (i == 0) {
          weekdays.add(7);
        } else {
          weekdays.add(i);
        }
      }
    }
    NotificationApi.showScheduledNotification(
        id: tile, title: alarm.tilte, alarm: alarm, weekdays: weekdays);

    String json = jsonEncode(_alarms);
    await preferences.setString(_keyAlarms, json);
  }
}
