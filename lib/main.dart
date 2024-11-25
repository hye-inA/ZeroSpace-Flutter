import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:zeroplace/common/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ko_KR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'roboto'),
        debugShowCheckedModeBanner: false,
        home: HomeScreen() //SplashScreen(),
        );
  }
}
