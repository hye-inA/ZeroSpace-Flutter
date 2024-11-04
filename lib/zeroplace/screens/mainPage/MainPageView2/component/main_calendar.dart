import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: onDaySelected,
      // 날짜 선택 시 실행할 함수
      selectedDayPredicate: (date) => // 선택된 날짜를 구분할 로직
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay: DateTime.now(), // 화면에 보여줄 날짜를 현재 앱이 실행되고 있는 날짜로 설정
      firstDay: DateTime(2024, 1, 1),
      lastDay: DateTime(2025, 1, 1),
      headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          )),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          selectedTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
