import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';

class LoginBackground extends StatelessWidget {
  final List<Widget> children;

  const LoginBackground({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.PRIMARY_GREEN,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
