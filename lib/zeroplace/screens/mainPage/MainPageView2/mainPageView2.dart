import 'package:flutter/material.dart';
import 'package:zeroplace/zeroplace/screens/mainPage/MainPageView2/component/main_calendar.dart';

class MainPageView2 extends StatefulWidget {
  const MainPageView2({super.key});

  @override
  State<MainPageView2> createState() => _MainPageView2State();
}

// 선탠된 날짜를 관리할 변수
class _MainPageView2State extends State<MainPageView2> {
  DateTime selectedDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // 시스템 UI 피해서 UI 구현하기
        child: Column(
          children: [
            // 달력 위젯
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달
              onDaySelected: onDaySelected, // 날짜가 선택됐을때 실행할 함수
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
