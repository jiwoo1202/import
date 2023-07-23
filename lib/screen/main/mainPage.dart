import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../firebase/firebase_test.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: ()async{
            await firebaseTestUpload();
          },
            child: Text('캘린더')),
      ),
      body: TableCalendar(
        locale: 'ko_KR',
        focusedDay: focusedDay, firstDay: DateTime.utc(2023,1,1), lastDay: DateTime.utc(2025,01,01),
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          // 선택된 날짜의 상태를 갱신합니다.
          setState((){
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
        },
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        selectedDayPredicate: (DateTime day) {
          // 선택된 날짜의 모양을 바꾸고, 오늘 날짜인 경우에만 todayDecoration을 적용합니다.
          if (isSameDay(selectedDay, day)) {
            return true; // 선택된 날짜의 모양을 바꿉니다.
          }
          else if (isSameDay(DateTime.now(), day)) {
            return false; // 오늘 날짜는 todayDecoration을 적용하지 않습니다.
          }
          return false;
        },
        calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSameDay(DateTime.now(), selectedDay)?Colors.black:Colors.black
            ),
            todayTextStyle: TextStyle(color: Colors.red),
            selectedDecoration: BoxDecoration(
              color:isSameDay(DateTime.now(), selectedDay)?Colors.black:Color(0xff89FAC3),
              shape: BoxShape.circle,
            ),
        ),
      ),

    );
  }
}
