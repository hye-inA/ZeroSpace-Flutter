import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class TimeSlotItem extends StatelessWidget {
  final String time;
  final String nextTime;
  final bool isSelected;
  final bool isReserved;
  final Function() onTap;

  const TimeSlotItem({
    required this.time,
    required this.nextTime,
    required this.isSelected,
    required this.isReserved,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isReserved ? onTap : null,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[100] : null,
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text('$time ~ $nextTime'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isReserved ? Colors.green : Colors.grey,
                ),
              ),
              child: Text(
                isReserved ? '예약가능' : '예약불가',
                style: TextStyle(
                  color: isReserved ? AppColors.PRIMARY_GREEN : Colors.grey,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
