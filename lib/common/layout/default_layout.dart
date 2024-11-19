import 'package:flutter/material.dart';

// 전체 view에 특정 기능을 적용하고 싶을때 사용
class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 키보드 올라올 때 화면 조정
      backgroundColor: backgroundColor ?? Colors.white,
      resizeToAvoidBottomInset: true,
      body: child,
    );
  }
}
