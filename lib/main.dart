import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';
import 'package:zeroplace/common/view/splash_screen.dart';
import 'package:zeroplace/zeroplace/screens/mainPage/MainPageView3/view/login_screen.dart';

import 'zeroplace/screens/mainPage/MainPageView1/mainPageView1.dart';
import 'zeroplace/screens/mainPage/MainPageView2/screen/mainPageView2.dart';

void main() {
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
        home: SplashScreen() //MainPage(),
        );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: this.pageController,
        onPageChanged: (int index) {
          this.setState(() {
            bottomIndex = index;
          });
        },
        children: [
          MainPageView1(),
          MainPageView2(),
          LoginScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room),
            label: "스터디룸",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "예약현황",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "로그인",
          ),
        ],
        // item 3개 이상일때 디폴드로 적용되는 색상, 애니메이션 적용 해제
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.DARK_GREEN_COLOR,
        currentIndex: bottomIndex,
        onTap: (int index) {
          //아이콘이 선택되었을때 build() 함수 재실행하면서 선택된 page index 값을 넘겨주어서 페이지 전환
          this.setState(() {
            bottomIndex = index;
            this.pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
