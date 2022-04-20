// ignore_for_file: prefer_const_constructors

import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/app_theme.dart';
import '../../../core/widgets/language_button.dart';

class PelvicExercises extends StatefulWidget {
  final String exercisenumber;

  const PelvicExercises({Key? key, required this.exercisenumber})
      : super(key: key);
  @override
  _PelvicExercisesState createState() => _PelvicExercisesState();
}

class _PelvicExercisesState extends State<PelvicExercises> {
  // late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    String page = widget.exercisenumber;
    
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
        backgroundColor: AppTheme.background,
       // elevation: 0.0,
        titleSpacing: 10.0,
        //centerTitle: true,

        leading: InkWell(
          child: Icon( Icons.arrow_back_ios, color: AppTheme.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
       
      ),
   /*   drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.blueGrey[500], //χρωμα του header του drawer
              // decoration:BoxDecoration(color:Colors.blue), διαφορετικος τροπος να περασουμε χρωμα
              child: Text(
                "Cardiocare",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home_screen');
                }),
          ],
        ),
      ),*/
      body: WebViewPlus(

        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller.loadUrl('assets/pelvicexercises/exercise$page.html');
        },
      )

      // WebView(
      //javascriptMode: JavascriptMode.unrestricted,
      // initialUrl: '',
      // onWebViewCreated: (WebViewController webViewController) async {
      //   _controller = webViewController;
      //  await loadHtmlFromAssets('assets/pelvicexercises/index.html', _controller);
      //
      //  },
    );
  }
}
