
import 'package:easy_localization/easy_localization.dart';
import 'package:cardiocare_expressive_writting/geriatric/incontinence/services/notification_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'core/widgets/app.dart';
import 'geriatric/incontinence/services/data.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails? note;

void main() async {
  // ensure flutter is initialized properly
  WidgetsFlutterBinding.ensureInitialized();

  // ensure localization engine is initialized
  await EasyLocalization.ensureInitialized();

  //await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  //await NotificationApi.init();
  await Data.init();


  runApp(ChangeNotifierProvider(
    create: (context) => Data(),
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('el')],
        path: 'assets/locales',
        fallbackLocale: const Locale('en'),
        child:  App()),
  )
  );
}



