// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:cardiocare_expressive_writting/core/widgets/language_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:async';
import 'form_screen.dart';
import 'package:cardiocare_expressive_writting/core/widgets/app.dart';
import 'package:cardiocare_expressive_writting/psychology/expressive_writing/services/data.dart';

import '../utilities/constantscolors.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

class _ResultsScreenState extends State<ResultsScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
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
                      'EXPRESSIVE WRITING: Feedback                                          \n\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'For this writing exercise, you were asked to write 5-10 minutes about your deepest thoughts and feelings about Your Thoughts And Feelings About Cancer . Before looking at your feedback, it’s important that you know that you are the real judge of your writing. Did you find it helpful? Are you thinking about the topic in a different way than when you started?',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: AppTheme.black,
                    ),
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'Time Taken: ' +
                                formatTime(_stopwatch.elapsedMilliseconds) +
                                '                                                                                           ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        // ElevatedButton(
                        //     onPressed: handleStartStop,
                        //     child: Text(
                        //         _stopwatch.isRunning ? 'Stop' : 'Start')),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                            'Word Count: ' +
                                '                                                                                                                   ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: AppTheme.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                            'Your Writing\n\n                                                                                                ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: AppTheme.black,
                    ),
                    const SizedBox(
                      height: 500,
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
