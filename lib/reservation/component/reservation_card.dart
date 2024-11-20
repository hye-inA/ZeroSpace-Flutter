import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class ReservationCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String studyroomName;
  final String userName;

  const ReservationCard({
    required this.startTime,
    required this.endTime,
    required this.userName,
    required this.studyroomName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.LIGHT_GREY_COLOR,
            border: Border.all(
              width: 1.0,
              color: AppColors.DARK_GREEN_COLOR,
            ),
            borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: 16.0),
                _Time(startTime: startTime, endTime: endTime),
                SizedBox(width: 16.0),
                _Content(
                  studyroomName: studyroomName,
                  userName: userName,
                ),
                SizedBox(width: 16.0),
              ],
            ),
          ),
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
  final String userName;
  final String studyroomName;

  const _Content({
    required this.userName,
    required this.studyroomName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.6, color: AppColors.PRIMARY_GREEN),
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 4.0,
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                studyroomName,

                /// TODO : copyWith 적용
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.DARK_GREEN_COLOR,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Text(
            userName,

            /// TODO : copyWith 적용
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.DARK_GREEN_COLOR,
              fontSize: 16.0,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
