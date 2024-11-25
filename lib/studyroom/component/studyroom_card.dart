import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_strings.dart';
import 'package:zeroplace/common/const/app_theme.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/common/widgets/background.dart';

class StudyroomCard extends StatelessWidget {
  // 스터디룸 이름
  final String name;

  // 스터디룸 최대 인원
  final int capacity;

  const StudyroomCard({
    required this.name,
    required this.capacity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Background(
            children: [
              Text(
                AppStrings.pleaseChooseStudyroom,
                style: AppTheme.titleMiddle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
