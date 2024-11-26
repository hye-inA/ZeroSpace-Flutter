import 'package:flutter/material.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/reservation/component/calendar.dart';
import 'package:zeroplace/reservation/component/reservation_card.dart';
import 'package:zeroplace/reservation/component/today_banner.dart';
import 'package:zeroplace/reservation/model/reservation.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<ReservationScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  Map<DateTime, List<Reservation>> reservations = {
    DateTime.utc(2024, 11, 26): [
      Reservation(
        id: 1,
        startTime: 9,
        endTime: 16,
        studyroomName: '스터디룸1',
        memberName: '허혜인',
        date: DateTime.utc(2024, 11, 26),
        createdAt: DateTime.now().toUtc(),
      ),
      Reservation(
        id: 2,
        startTime: 10,
        endTime: 23,
        studyroomName: '스터디룸2',
        memberName: '정주원',
        date: DateTime.utc(2024, 11, 26),
        createdAt: DateTime.now().toUtc(),
      ),
    ],
    DateTime.utc(2024, 11, 27): [
      Reservation(
        id: 1,
        startTime: 9,
        endTime: 16,
        studyroomName: '스터디룸1',
        memberName: '장윤영',
        date: DateTime.utc(2024, 11, 26),
        createdAt: DateTime.now().toUtc(),
      ),
    ]
  };

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: ListView.builder(
                  itemCount: reservations.containsKey(selectedDate)
                      ? reservations[selectedDate]!.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    // 선택된 날짜에 해당되는 예약 일정 리스트로 저장
                    // List<Reservation>
                    final selectedReservations = reservations[selectedDate]!;
                    final reservationModel = selectedReservations[index];

                    return ReservationCard(
                      startTime: reservationModel.startTime,
                      endTime: reservationModel.endTime,
                      memberName: reservationModel.memberName,
                      studyroomName: reservationModel.studyroomName,
                    );
                  },
                ),
              ),
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
