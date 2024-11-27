import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class StudyroomCard extends StatelessWidget {
  // 스터디룸 이름
  final String studyroomName;

  // 스터디룸 최대 인원
  final int capacity;

  const StudyroomCard({
    required this.studyroomName,
    required this.capacity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 8.0,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    studyroomName,
                    style: TextStyle(
                      color: AppColors.DARK_GREEN_COLOR,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '최대 $capacity인',
                    style: TextStyle(
                      color: AppColors.DARK_GREY_COLOR,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Container(
            child: Icon(
              Icons.chevron_right,
              size: 28.0,
            ),
          )
        ],
      ),
    );
  }
}
