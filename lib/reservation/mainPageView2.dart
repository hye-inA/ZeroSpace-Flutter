import 'package:flutter/material.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/reservation/component/main_calendar.dart';
import 'package:zeroplace/reservation/component/reservation_card.dart';

/// 책에서의 home_screen.dart
class MainPageView2 extends StatefulWidget {
  const MainPageView2({super.key});

  @override
  State<MainPageView2> createState() => _MainPageView2State();
}

class _MainPageView2State extends State<MainPageView2> {
  DateTime selectedDate = DateTime.utc(
    // 선탠된 날짜를 관리할 변수
    DateTime.now().year, DateTime.now().month, DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        // 시스템 UI 피해서 UI 구현하기s
        child: Column(
          children: [
            // 달력 위젯
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달
              onDaySelected: onDaySelected, // 날짜가 선택됐을때 실행할 함수
            ),
            ReservationCard(
              startTime: 10,
              endTime: 16,
              studyroomName: "스터디룸 1",
              userName: "허혜인",
            ),
          ],
        ),
      ),
    );
  }

  // 날짜가 탭 될때마다 selectDate 변수 변경
  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
