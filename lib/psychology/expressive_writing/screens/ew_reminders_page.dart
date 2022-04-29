// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/core/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/utilities/app_theme.dart';
import '../../../core/widgets/language_button.dart';
import '../services/data.dart';
import '../services/notification_api.dart';
import '../widgets/alarm_tile.dart';
import 'ew_add_reminder.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final onNotifications = BehaviorSubject<String?>();

  @override
  void initState() {
    super.initState();
    NotificationApi.init(initScheduled: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: AppTheme.black,
            iconSize: 32,
          ),
          LanguageButton(),
        ],
        iconTheme: IconThemeData(color: AppTheme.black),
        // iconTheme: IconThemeData(color:  Color(0xFF17262A)),
        backgroundColor: AppTheme.background,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'geriatric.expressive_writing.addReminder.title',
          style: TextStyle(color: AppTheme.black),
        ).tr(),
        /*    shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),), */
      ),
      /*drawer: Drawer(
               child: Column(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey[500],
                // decoration:BoxDecoration(color:Colors.blue), διαφορετικος τροπος να περασουμε χρωμα
                child: Text(
                  "Cardiocare",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
              ListTile(title:Text("Home"), leading: Icon(Icons.home), onTap:(){Navigator.pushReplacementNamed(context, '/home_screen');}),


            ],
          ),
         ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: AddReminder(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: AppTheme.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            'geriatric.expressive_writing.addReminder.yourReminders'.tr(),
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: AppTheme.black),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlarmTile(
                  isChecked:
                      Provider.of<Data>(context).allAlarms[index].isActive,
                  checkboxCallback: (checkboxstate) {
                    print(checkboxstate!);
                    Provider.of<Data>(context, listen: false).changeState(
                        Provider.of<Data>(context, listen: false)
                            .allAlarms[index],
                        index);

                    if (!checkboxstate) {
                      NotificationApi.cancellNotification(
                          Provider.of<Data>(context, listen: false)
                              .allAlarms[index]
                              .tilte
                              .hashCode);
                      print(
                          '1st ${Provider.of<Data>(context, listen: false).allAlarms[index].tilte.hashCode}');
                    } else {
                      NotificationApi.showScheduledNotification(
                          id: Provider.of<Data>(context, listen: false)
                              .allAlarms[index]
                              .tilte
                              .hashCode,
                          alarm: Provider.of<Data>(context, listen: false)
                              .allAlarms[index],
                          title: Provider.of<Data>(context, listen: false)
                              .allAlarms[index]
                              .tilte,
                          weekdays: weekdays(
                              Provider.of<Data>(context, listen: false)
                                  .allAlarms[index]
                                  .values));
                    }
                  },
                  timeOfDay:
                      Provider.of<Data>(context).allAlarms[index].timeOfDay,
                  dateTime:
                      Provider.of<Data>(context).allAlarms[index].dateTime,
                  values: Provider.of<Data>(context, listen: false)
                      .allAlarms[index]
                      .values,
                  weekdayChangeCallBack: (value) {
                    Provider.of<Data>(context, listen: false).changeWeekday(
                        Provider.of<Data>(context, listen: false)
                            .allAlarms[index],
                        value!,
                        index);
                  },
                  title: Provider.of<Data>(context, listen: false)
                      .allAlarms[index]
                      .tilte,
                  deleteNotification: () {
                    Provider.of<Data>(context, listen: false).removeAlarm(
                        Provider.of<Data>(context, listen: false)
                            .allAlarms[index]);
                  },
                );
              },
              itemCount: Provider.of<Data>(context).alarmsCount,
            ),
          ),
        ],
      ),
    );
  }
}

List<int> weekdays(List<String> selectedDays) {
  print(selectedDays);
  List<int> temp = [];
  for (int i = 0; i < 7; i++) {
    if (selectedDays[i] == 'true') {
      temp.add(i);
    }
  }
  return temp;
}
