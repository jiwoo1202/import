import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../firebase/firebase_test.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMPORT'),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 200,
          )
        ],
      ),

    );
  }
}
