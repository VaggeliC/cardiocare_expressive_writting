// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class AlarmTile extends StatelessWidget {
  AlarmTile(
      {Key? key,
      required this.isChecked,
      required this.checkboxCallback,
      required this.timeOfDay,
      required this.dateTime,
      required this.values,
      required this.weekdayChangeCallBack,
      required this.title,
      required this.deleteNotification})
      : super(key: key);

  final List<String> eh = List.filled(7, "false");
  final List<String> values;
  final Function(int?) weekdayChangeCallBack;
  final bool isChecked;
  final Function(bool?) checkboxCallback;
  final String timeOfDay;
  final DateTime dateTime;
  final String title;
  final Function() deleteNotification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        print('This Tile is tapped');
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 15.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.label,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: isChecked,
                  onChanged: checkboxCallback,
                  activeColor: Colors.orange,
                ),
              ],
            ),
            WeekdaySelector(
              selectedColor: Colors.black,
              selectedFillColor: Colors.orange,
              onChanged: weekdayChangeCallBack,
              values: getIt(values),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // timeOfDay.format(context),
                  timeOfDay,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: deleteNotification,
                  icon: Icon(
                    Icons.delete,
                    size: 30.0,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<bool> getIt(List<String> values) {
  List<bool> listBool = <bool>[];
  values.forEach(
      (item) => item == "true" ? listBool.add(true) : listBool.add(false));
  return listBool;
}
