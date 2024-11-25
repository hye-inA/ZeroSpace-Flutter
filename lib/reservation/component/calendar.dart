import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDate;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;

  Calendar({
    required this.focusedDate,
    required this.onDaySelected,
    required this.selectedDayPredicate,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.DARK_GREEN_COLOR,
    );

    final defaultBoxDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.PRIMARY_GREEN,
    );

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDate,
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate,
      firstDay: DateTime(2024, 1, 1),
      lastDay: DateTime(2025, 12, 31),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: AppColors.DARK_GREEN_COLOR,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: AppColors.DARK_GREEN_COLOR,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: defaultTextStyle.copyWith(
            fontSize: 14.0, fontWeight: FontWeight.bold),
        weekendStyle: defaultTextStyle.copyWith(
            fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayDecoration:
              defaultBoxDecoration.copyWith(color: AppColors.PRIMARY_ORRANGE),
          selectedDecoration: defaultBoxDecoration,
          todayTextStyle: defaultTextStyle.copyWith(color: Colors.white),
          selectedTextStyle: defaultTextStyle.copyWith(color: Colors.white),
          defaultTextStyle:
              defaultTextStyle.copyWith(color: AppColors.DARK_GREY_COLOR),
          weekendTextStyle: defaultTextStyle,
          outsideTextStyle: defaultTextStyle.copyWith(color: Colors.grey[400])),
    );
  }
}
