import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class ReservationCard extends StatelessWidget {
  final int startTime;
  final int endTime;

  final String studyroomName;
  final String memberName;

  const ReservationCard({
    required this.startTime,
    required this.endTime,
    required this.memberName,
    required this.studyroomName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        /// TODO : 높이 수정
        height: MediaQuery.of(context).size.height * 0.05,
        padding: EdgeInsets.only(bottom: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Time(startTime: startTime, endTime: endTime),
            SizedBox(width: 16.0),
            _Content(
              studyroomName: studyroomName,
              memberName: memberName,
            ),
          ],
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final int startTime;
  final int endTime;

  _Time({required this.startTime, required this.endTime, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.DARK_GREEN_COLOR,
      fontSize: 16.0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${startTime.toString().padLeft(2, '0')}:00',
          style: textStyle,
        ),
        Text(
          '~ ${endTime.toString().padLeft(2, '0')}:00',
          style: textStyle.copyWith(fontSize: 10.0),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final String memberName;
  final String studyroomName;

  const _Content({
    required this.memberName,
    required this.studyroomName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: AppColors.DARK_GREEN_COLOR,
      letterSpacing: 1.0,
    );

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.LIGHT_GREY_COLOR,
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                child: Text(
                  studyroomName,
                  style: textStyle,
                ),
              ),
              SizedBox(width: 20.0),
              Text(
                memberName,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
