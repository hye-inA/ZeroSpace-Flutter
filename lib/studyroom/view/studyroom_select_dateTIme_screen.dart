import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zeroplace/common/const/app_strings.dart';
import 'package:zeroplace/common/const/app_theme.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/common/widgets/background.dart';
import 'package:zeroplace/studyroom/model/studyroom.dart';

import '../../common/const/app_colors.dart';
import '../component/time_slot_item.dart';

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
  DateTime _selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  bool _isAfternoon = true;

  final List<String> morningTimeSlots = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
  ];

  final List<String> afternoonTimeSlots = [
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
    '24:00',
  ];

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this._selectedDate = selectedDate;
      this.focusedDate = focusedDate;
    });
  }

  void _handleTimeSlotTap(String time) {
    final tappedHour = int.parse(time.split(':')[0]);

    // 시작 시간 선택 ( 새로운 시간 시간 선택 )
    if (_startTime == null || _startTime != null && _endTime != null) {
      setState(() {
        _startTime = TimeOfDay(hour: tappedHour, minute: 0);
        _endTime = null;
      });
    }
    // 종료 시간 선택
    else {
      final startHour = _startTime!.hour;
      // 시작 시간보다 이후 시간대만 선택 가능
      if (tappedHour > startHour) {
        setState(() {
          _endTime = TimeOfDay(hour: tappedHour, minute: 0);
        });
      }
    }
  }

  /// 기능 - 각 시간대가 선택된 시작 - 종료 시간 범위 안에 포함 여부 확인
  /// 입력 매개변수 - time : 확인할 시간대 ( ex. "14:00" 형식 문자열 )
  /// 반환값 - bool 값 ( true : 선택된 범위 안에 있음, false : 선택된 범위 밖, 시간/종료시간 선택안됨 )
  bool isTimeSlotSelected(String time) {
    if (_startTime == null || _endTime == null) return false;

    final currentHour = int.parse(time.split(':')[0]);
    final startHour = _startTime!.hour;
    final endHour = _endTime!.hour;

    return currentHour >= startHour && currentHour < endHour;
  }

  // 예약 가능 여부 확인
  bool isTimeSlotReserved(String time) {
    final hour = int.parse(time.split(':')[0]);
    if (_isAfternoon) {
      return hour < 24;
    }
    return true;
  }

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
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _TimeToggleButton(
                                    text: '오전',
                                    isSelected: !_isAfternoon,
                                    onTap: () =>
                                        setState(() => _isAfternoon = false),
                                  ),
                                  _TimeToggleButton(
                                    text: '오후',
                                    isSelected: _isAfternoon,
                                    onTap: () =>
                                        setState(() => _isAfternoon = true),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Column(
                        children: (_isAfternoon
                                ? afternoonTimeSlots
                                : morningTimeSlots)
                            .asMap()
                            .entries
                            .map((entry) {
                          final index = entry.key;
                          final time = entry.value;
                          final slots = _isAfternoon
                              ? afternoonTimeSlots
                              : morningTimeSlots;
                          final isSelected = isTimeSlotSelected(time);
                          final isReserved = isTimeSlotReserved(time);
                          return TimeSlotItem();
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _TimeToggleButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.PRIMARY_GREEN : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
