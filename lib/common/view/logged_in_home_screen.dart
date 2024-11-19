import 'package:flutter/material.dart';
import 'package:zeroplace/common/layout/default_layout.dart';

class LoggedInHomeScreen extends StatelessWidget {
  const LoggedInHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text('LoggedInHomePage'),
      ),
    );
  }
}
