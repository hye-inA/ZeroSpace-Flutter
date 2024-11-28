import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zeroplace/common/const/app_strings.dart';
import 'package:zeroplace/common/const/app_theme.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/common/widgets/background.dart';
import 'package:zeroplace/studyroom/model/studyroom.dart';

import '../../common/const/app_colors.dart';

class StudyroomSelectDatetimeScreen extends StatefulWidget {
  final Studyroom studyroom;

  const StudyroomSelectDatetimeScreen({
    required this.studyroom,
    super.key,
  });

  @override
  State<StudyroomSelectDatetimeScreen> createState() =>
      _StudyroomSelectDatetimeScreenState();
}

class _StudyroomSelectDatetimeScreenState
    extends State<StudyroomSelectDatetimeScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

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

    return DefaultLayout(
      title: '',
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Background(
              children: [
                Text(
                  '스터디룸1',
                  style: AppTheme.bodySmall,
                ),
                Text(
                  AppStrings.pleaseChooseDatetime,
                  style: AppTheme.titleMiddle,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TableCalendar(
                          locale: 'ko_KR',
                          focusedDay: focusedDate,
                          onDaySelected: onDaySelected,
                          firstDay: DateTime(2024, 1, 1),
                          lastDay: DateTime(2025, 12, 31),
                          headerStyle: HeaderStyle(
                            titleCentered: true,
                            formatButtonVisible: false,
                            titleTextStyle: defaultTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
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
                              todayDecoration: defaultBoxDecoration.copyWith(
                                  color: AppColors.PRIMARY_ORRANGE),
                              selectedDecoration: defaultBoxDecoration,
                              todayTextStyle: defaultTextStyle.copyWith(
                                  color: Colors.white),
                              selectedTextStyle: defaultTextStyle.copyWith(
                                  color: Colors.white),
                              defaultTextStyle: defaultTextStyle.copyWith(
                                  color: AppColors.DARK_GREY_COLOR),
                              weekendTextStyle: defaultTextStyle,
                              outsideTextStyle: defaultTextStyle.copyWith(
                                  color: Colors.grey[400])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
      this.focusedDate = focusedDate;
    });
  }
}
