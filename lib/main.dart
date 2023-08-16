import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:import_new_pr/screen/myPage/myPageMain.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screen/login_register/loginPage.dart';
import 'screen/main/mainPage.dart';
import 'screen/main_screen.dart';


void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  print('-- WidgetsFlutterBinding.ensureInitialized');
  // NotificationController.initioalizeNotificationService();
  // print('-- NotificationController.initioalizeNotificationService');
  await initializeDateFormatting();
  await Firebase.initializeApp();
  print('-- main: Firebase.initializeApp');

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MypageMain()
    );
  }
}
