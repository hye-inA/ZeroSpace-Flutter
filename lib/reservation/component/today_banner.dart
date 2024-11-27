import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDate;
  final int reservationCount;

  const TodayBanner({
    required this.selectedDate,
    required this.reservationCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.DARK_GREEN_COLOR,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    '$reservationCount',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.DARK_GREEN_COLOR,
                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
