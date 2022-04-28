// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:cardiocare_expressive_writting/core/widgets/language_button.dart';
import 'package:cardiocare_expressive_writting/psychology/expressive_writing/screens/results_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/psychology/expressive_writing/model/alert_util.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:async';
import 'package:cardiocare_expressive_writting/core/widgets/app.dart';
import 'package:cardiocare_expressive_writting/psychology/expressive_writing/services/data.dart';

import '../utilities/constantscolors.dart';

class FormWidgetsDemo extends StatefulWidget {
  const FormWidgetsDemo({Key? key}) : super(key: key);

  @override
  _FormWidgetsDemoState createState() => _FormWidgetsDemoState();
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;
  late Stopwatch _stopwatch;
  late Timer _timer;
  RegExp regExp = RegExp(" ");
  int wordcount = 0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        actions: [
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: AppTheme.black,
            iconSize: 32,
          ),
          LanguageButton()
        ],
        //  iconTheme: const IconThemeData(color: Color(0xFF17262A)),
        iconTheme: const IconThemeData(color: AppTheme.black),

        backgroundColor: AppTheme.background,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'psychology.expressiveWriting.urinaryTitle',
          style: TextStyle(fontSize: 25, color: AppTheme.black),
        ).tr(),
        /*  shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),*/
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          //alignment: Alignment.topCenter,
          child: Card(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 550),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'EXPRESSIVE WRITING: Your thoughts and feelings about cancer\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      'In the box below, explore your thoughts and feelings about cancer in as much detail as you can. Try to let go and just write for at least 5-10 minutes (or longer if you want). You might write about how the outbreak is affecting you and the people around you. Or how is it related to other significant experiences in your life? Or how are you dealing with feelings such as anxiety or isolation? Really try to address those issues most important and significant for you. Please write continuously for the entire time, and don’t worry too much about spelling or punctuation errors.\n\nAll information will be kept anonymous and confidential.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 19,
                      ),
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: AppTheme.black,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ...[
                      _FormDatePicker(
                        date: date,
                        onChanged: (value) {
                          setState(() {
                            date = value;
                          });
                        },
                      ),
                    ].expand(
                      (widget) => [
                        widget,
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'Timer: ' +
                                formatTime(_stopwatch.elapsedMilliseconds),
                            style: TextStyle(
                                fontSize: 20.0,
                                background: Paint()
                                  ..strokeWidth = 25.0
                                  ..color = Colors.grey
                                  ..style = PaintingStyle.stroke
                                  ..strokeJoin = StrokeJoin.round)),
                        // ElevatedButton(
                        //     onPressed: handleStartStop,
                        //     child: Text(
                        //         _stopwatch.isRunning ? 'Stop' : 'Start')),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: 'Write your thoughts and feelings...',
                        //labelText: 'Description',
                      ),
                      onChanged: (value) {
                        _stopwatch.start();
                        description = value;

                        if (kDebugMode) {
                          wordcount = regExp.allMatches(value).length + 1;
                          print(wordcount);
                        }
                      },
                      maxLines: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () => {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate() &&
                              wordcount > 0)
                            {
                              _stopwatch.stop(),
                              print(formatTime(_stopwatch.elapsedMilliseconds)),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ResultsScreen()))),
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              ),
                            }
                          else
                            {
                              AlertUtil.showAlert(context, "Alert",
                                  "You have to write something in order for us to analyze.")
                            }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date: ' + intl.DateFormat.yMd().format(widget.date),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        // TextButton(
        //   //child: const Text('Edit'),
        //   onPressed: () async {
        //     var newDate = await showDatePicker(
        //       context: context,
        //       initialDate: widget.date,
        //       firstDate: DateTime(1900),
        //       lastDate: DateTime(2100),
        //     );
        //
        //     // Don't change the date if the date picker returns null.
        //     if (newDate == null) {
        //       return;
        //     }
        //
        //     widget.onChanged(newDate);
        //   },
        // )
      ],
    );
  }
}
