// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison, prefer_final_fields, unused_import, unnecessary_new, file_names


import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../../../core/widgets/language_button.dart';
import '../model/urinetrackclass.dart';
//import 'package:date_field/date_field.dart';


class UrineTrackPage extends StatefulWidget {
  const UrineTrackPage({Key? key}) : super(key: key);
  @override
  _UrineTrackPageState createState() => _UrineTrackPageState();
}

TextEditingController ProblemsPage2 = new TextEditingController();
TextEditingController Date = new TextEditingController();

TextEditingController Scale = new TextEditingController();

List<DataRow> dataRows = [];
String _dropDownValue = "";
String _dropDownValueEvent = "";

class _UrineTrackPageState extends State<UrineTrackPage> {
  //bool _validate = false;
  sendProblemstoDb() async {
   
    String date = Date.text;

    UrineTrackClass urinetrackobject = UrineTrackClass(
      _dropDownValueEvent,
      date,
      _dropDownValue,
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.background,
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
          iconTheme: IconThemeData(color:  AppTheme.black),
          backgroundColor: AppTheme.background,
         // automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('geriatric.expressive_writing.urineTrack',style: TextStyle(fontSize:25, color: AppTheme.black),).tr(),
/*         shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),),*/
        ),
/*        drawer: Drawer(
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
        body: Builder(
            builder: (context) => ListView(children: <Widget>[
                 Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          
                           style: ElevatedButton.styleFrom(
                             primary: AppTheme.green,
                             minimumSize: Size(MediaQuery.of(context).size.width*0.6,MediaQuery.of(context).size.height*0.05),
                             shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            
                          
                          ),),
                            child: Text('geriatric.expressive_writing.urineTrackPage.addEvent',style: TextStyle(fontSize: 25),).tr(),
                
                            onPressed: () {
                              _openPopup(context);
                            }),
                      )),
                  DataTable(
                    dataRowHeight:70,
                   
                    dataTextStyle: TextStyle(fontSize: 20,color: AppTheme.black,),
                    headingTextStyle:TextStyle(fontSize: 23,color: AppTheme.black,fontWeight: FontWeight.bold,),
                    columns: [
                      DataColumn(label: Text('geriatric.expressive_writing.urineTrackPage.event', ).tr()),
                      DataColumn(label: Text('geriatric.expressive_writing.urineTrackPage.date',).tr()),
                      DataColumn(label: Text('geriatric.expressive_writing.urineTrackPage.intensity',).tr()),
                    ],
                    rows: dataRows,
                  ),
                ])),
      
    );
  }

  _openPopup(context) {
    Alert(
        context: context,
        title: "geriatric.expressive_writing.urineTrackPage.eventLog".tr(),
        content: StatefulBuilder(
            // ignore: missing_return
            builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: <Widget>[
               DropdownButtonFormField(
                 itemHeight:80,
                decoration: InputDecoration(labelText: 'geriatric.expressive_writing.urineTrackPage.event'.tr(),labelStyle: TextStyle(fontSize:25)),
                hint: _dropDownValueEvent == null
                    ? Text('Select Event')
                    : Text(
                        _dropDownValueEvent,
                        style: TextStyle(color: AppTheme.black,fontSize: 25),
                      ),
                isExpanded: true,
                style: TextStyle(color: AppTheme.black,fontSize: 20),
                items: ['geriatric.expressive_writing.urineTrackPage.urination'.tr(),
                        'geriatric.expressive_writing.urineTrackPage.leak'.tr(),
                        'geriatric.expressive_writing.urineTrackPage.urge'.tr(),
                        'geriatric.expressive_writing.urineTrackPage.etc'.tr()].map(
                  (valE) {
                    // print(_dropDownValue.toString());
                    return DropdownMenuItem<String>(
                      value: valE,
                      child: Text(valE),
                    );
                  },
                ).toList(),
                onChanged: (valE) {
                  setState(
                    () {
                      _dropDownValueEvent = valE.toString();
                    },
                  );
                },
              ),
              SizedBox(height: 30,),
              TextField(
                  controller: Date,
                  decoration: InputDecoration(
                    hintText: "geriatric.expressive_writing.urineTrackPage.pickDate".tr(),
                    hintStyle: TextStyle(fontSize: 25),
                    labelStyle: TextStyle(fontSize: 25),
                    icon: Icon(Icons.date_range),
                  ),
                  onTap: () async {
                    var pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime( 2021), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            Date.text =
                                formattedDate; //set output date to TextField value.
                          });
                    }
            }),
            SizedBox(height: 30,),
            /* DateTimeFormField(
              
              decoration: InputDecoration(
                fillColor: Colors.orange,
                focusColor: Colors.red,
                hoverColor: Colors.green,
                errorText: _validate ? "Fill the date" : null,
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
              ),
          onDateSelected: (DateTime value) {
                        if (value != null) {
                          print(
                              value); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(value);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            Date.text =
                                formattedDate; //set output date to TextField value.
                          });
                    }
                    else{
                      _validate = true;
                    }
            }),*/
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'geriatric.expressive_writing.urineTrackPage.intensity'.tr(),labelStyle: TextStyle(fontSize:25)),
                hint: _dropDownValue == null
                    ? Text('Pick Intensity')
                    : Text(
                        _dropDownValue,
                        style: TextStyle(color: AppTheme.black, fontSize: 25),
                      ),
                isExpanded: true,
                style: TextStyle(color: AppTheme.black, fontSize: 25),
                items: ['1', '2', '3', '4', '5'].map(
                  (val) {
                    // print(_dropDownValue.toString());
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val.toString();
                    },
                  );
                },
              )
            ],
          );
        }),
        buttons: [
          DialogButton(
            height: 50,
            radius: new BorderRadius.circular(30.0),
            color:AppTheme.green,
            onPressed: () {
              setState(() {
                sendProblemstoDb();
               
                dataRows.add(DataRow(cells: [
                  DataCell(Text(_dropDownValueEvent)),
                  DataCell(Text(Date.text)),
                  DataCell(Text(_dropDownValue)),
                ]));
              

                _dropDownValueEvent = "";
                Date.text = "";
                _dropDownValue = "";
              });
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text(
              "geriatric.expressive_writing.urineTrackPage.addEvent",
              style: TextStyle(color: AppTheme.white, fontSize: 25),
            ).tr(),
          )
        ]).show();
  }
}
