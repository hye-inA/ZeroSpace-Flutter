import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_strings.dart';
import 'package:zeroplace/common/const/app_theme.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/common/widgets/background.dart';
import 'package:zeroplace/studyroom/component/daypicker_calendar.dart';
import 'package:zeroplace/studyroom/model/studyroom.dart';

import '../../common/const/app_colors.dart';
import '../component/time_slot_item.dart';

/// TODO: 컴포넌트 분리할거 분리하기
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
  DateTime _selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
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
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (_selectedDate == null) {
      return false;
    }
    return date.isAtSameMomentAs(_selectedDate);
  }

  void _handleTimeSlotTap(String time, String nextTime) {
    final tappedHour = int.parse(time.split(':')[0]);
    final nextHour = int.parse(nextTime.split(':')[0]);

    // 1. 아무것도 선택되지 않은 경우 -> 시작 시간 설정
    if (_startTime == null) {
      setState(() {
        _startTime = TimeOfDay(hour: tappedHour, minute: 0);
      });
      return;
    }

    final startHour = _startTime!.hour;

    // 2. 시작 시간만 선택된 경우
    if (_endTime == null) {
      // 2-1. 시작 시간보다 이전 시간 선택 -> 새로운 시작 시간으로 설정
      if (tappedHour <= startHour) {
        setState(() {
          _startTime = TimeOfDay(hour: tappedHour, minute: 0);
        });
      }
      // 2-2. 시작 시간보다 이후 시간 선택 -> 종료 시간으로 설정
      else {
        setState(() {
          _endTime = TimeOfDay(hour: nextHour, minute: 0);
        });
      }
    }
    // 3. 시작, 종료 시간 모두 선택된 경우 -> 새로운 시작 시간으로 설정
    else {
      setState(() {
        _startTime = TimeOfDay(hour: tappedHour, minute: 0);
        _endTime = null;
      });
    }
  }

  /// 기능 - 각 시간대가 선택된 시작,종료 시간 범위 안에 포함 여부 확인
  /// 입력 매개변수 - time : 확인할 시간대 ( ex. "14:00" 형식 문자열 )
  /// 반환값 - bool 값 ( true : 선택된 범위 안에 있음, false : 선택된 범위 밖, 시간/종료시간 선택안됨 )
  bool isTimeSlotSelected(String time) {
    final currentHour = int.parse(time.split(':')[0]);
    if (_startTime != null && _endTime == null) {
      return currentHour == _startTime!.hour;
    }
    if (_startTime != null && _endTime != null) {
      final startHour = _startTime!.hour;
      final endHour = _endTime!.hour;

      return currentHour >= startHour && currentHour < endHour;
    }

    return false;
  }

  // 예약 가능 여부 확인
  bool isTimeSlotReserved(String time) {
    final hour = int.parse(time.split(':')[0]);
    if (_isAfternoon) {
      return hour < 24;
    }
    return true;
  }

  /// 기능 - 선택된 날짜와 이용시간을 문자열로 반환
  /// 반환값 - String ( ex. "12월 2일 - 14:00 ~ 17:00, 3시간" )
  String getSelectedDateTimeSlot() {
    String dateStr = "${_selectedDate.month}월 ${_selectedDate.day}일";

    if (_startTime != null && _endTime != null) {
      String startTimeStr = "${_startTime!.hour.toString().padLeft(2, '0')}:00";
      String endTimeStr = "${_endTime!.hour.toString().padLeft(2, '0')}:00";
      int duration = _endTime!.hour - _startTime!.hour;

      return "$dateStr - $startTimeStr ~ $endTimeStr, ${duration}시간";
    }
    return "$dateStr";
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Background(
              children: [
                Text(
                  widget.studyroom.studyroomName,
                  style: AppTheme.titleSmall,
                ),
                Text(
                  getSelectedDateTimeSlot(),
                  style: AppTheme.bodyMiddle,
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
                        child: DaypickerCalendar(
                          focusedDate: DateTime.now(),
                          onDaySelected: onDaySelected,
                          selectedDayPredicate: selectedDayPredicate,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Column(
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

                            if (index == slots.length - 1) return Container();

                            return TimeSlotItem(
                              time: time,
                              nextTime: slots[index + 1],
                              isSelected: isSelected,
                              isReserved: isReserved,
                              onTap: () =>
                                  _handleTimeSlotTap(time, slots[index + 1]),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.PRIMARY_ORRANGE,
                          minimumSize: Size(double.infinity, 40.0),
                        ),
                        child: Text(
                          '예약하기',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15.0,
                            letterSpacing: 2.0,
                          ),
                        ),
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
