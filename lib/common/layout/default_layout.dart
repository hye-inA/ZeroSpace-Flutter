import 'package:flutter/material.dart';

// 전체 view에 특정 기능을 적용하고 싶을때 사용
class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: Colors.white,
    );
  }
}
