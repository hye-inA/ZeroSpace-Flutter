import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_colors.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/reservation/mainPageView2.dart';
import 'package:zeroplace/studyroom/view/studyroom_screen.dart';
import 'package:zeroplace/user/view/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int bottomIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      bottomIndex = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [StudyroomScreen(), MainPageView2(), LoginScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.DARK_GREEN_COLOR,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          this.setState(() {
            controller.animateTo(index);
          });
        },
        currentIndex: bottomIndex,
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
      ),
    );
  }
}
