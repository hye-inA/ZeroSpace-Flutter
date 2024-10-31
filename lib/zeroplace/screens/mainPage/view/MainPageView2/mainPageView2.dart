import 'package:flutter/material.dart';
import 'package:zeroplace/zeroplace/screens/mainPage/view/MainPageView2/component/main_calendar.dart';

class MainPageView2 extends StatelessWidget {
  const MainPageView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // 시스템 UI 피해서 UI 구현하기
        child: Column(
          //달력과 리스트 세로로 배치
          children: [
            // 달력 위젯
            MainCalendar(),
          ],
        ),
      ),
    );
  }
}
