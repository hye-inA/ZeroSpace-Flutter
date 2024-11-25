import 'package:flutter/material.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/reservation/component/calendar.dart';
import 'package:zeroplace/reservation/component/reservation_card.dart';
import 'package:zeroplace/reservation/component/today_banner.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDate: DateTime.now(),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate, // 선택된 날짜 전달
            ),
            Divider(),
            TodayBanner(
              selectedDate: selectedDate,
              reservationCount: 0,
            ),
            ReservationCard(
              startTime: DateTime(2024, 11, 25, 17),
              endTime: DateTime(2024, 11, 25, 22),
              studyroomName: "스터디룸 1",
              userName: "허혜인",
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

  bool selectedDayPredicate(DateTime date) {
    if (selectedDate == null) {
      return false;
    }
    return date.isAtSameMomentAs(selectedDate);
  }
}
