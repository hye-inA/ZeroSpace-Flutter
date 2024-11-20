import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/studyroom/view/banner_detail_screen.dart';
import 'package:zeroplace/studyroom/view/studyroom_list_screen.dart';

import '../../common/const/app_colors.dart';

class StudyroomScreen extends StatefulWidget {
  const StudyroomScreen({super.key});

  @override
  State<StudyroomScreen> createState() => _StudyroomScreenState();
}

class _StudyroomScreenState extends State<StudyroomScreen> {
  PageController pageController = PageController();

  BannerModel bannerModel = BannerModel(menus: [
    BannerMenuModel(txt: "1"),
    BannerMenuModel(txt: "2"),
    BannerMenuModel(txt: "3")
  ], items: [
    BannerItemModel(img: "assets/img/priceIncrementBanner.png"),
    BannerItemModel(img: "assets/img/refundBanner.png"),
    BannerItemModel(img: "assets/img/profile.png")
  ]);

  int pageIndex = 0;

  void run() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      this.pageController.nextPage(
            duration: Duration(seconds: 1),
            curve: Curves.linear,
          );
    });
  }

  @override
  void initState() {
    super.initState();
    run();
  }

  @override
  void dispose() {
    this.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'ZERO SPACE',
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: banner(bannerModel),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudyroomTicketList(),
                  ),
                );
              },
              child: PageView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                      bottom: 12.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.2,
                        color: AppColors.DARK_GREEN_COLOR,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Icon(
                            Icons.add_card,
                            color: Colors.black26,
                            size: 150.0,
                          ),
                        ),
                        //Spacer(),
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "스티디룸 예약",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: AppColors.DARK_GREY_COLOR,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Text(
                            "이용권 구매는 화면을 누르시면 가능합니다",
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget banner(BannerModel model) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 90.0,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: PageView.builder(
              onPageChanged: (int index) {
                this.pageIndex = index;
              },
              controller: pageController,
              itemBuilder: (BuildContext context, int index) {
                final pageIndex = index % bannerModel.items.length;
                final BannerItemModel item = model.items[pageIndex];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetailPage(index: pageIndex),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(item.img), fit: BoxFit.fill)),
                  ),
                );
              },
            ),
          ),
          Row(
            children: model.menus
                .map<Widget>((BannerMenuModel menuModel) => TextButton(
                      onPressed: () {
                        int index = model.menus.indexOf(menuModel);
                        this.pageController.jumpToPage(index);
                      },
                      child: Text(
                        menuModel.txt,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class BannerMenuModel {
  final String txt; // 배너 index
  const BannerMenuModel({required this.txt});
}

class BannerItemModel {
  final String img;

  const BannerItemModel({required this.img});
}

class BannerModel {
  final List<BannerMenuModel> menus;
  final List<BannerItemModel> items;
  final void Function(int)? onTap;

  const BannerModel({
    required this.menus,
    required this.items,
    this.onTap,
  });
}
