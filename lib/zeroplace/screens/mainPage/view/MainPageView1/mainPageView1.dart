import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zeroplace/const/color.dart';
import 'package:zeroplace/zeroplace/screens/detailPage/ticketPage.dart';

import '../../../detailPage/detailPage.dart';

class MainPageView1 extends StatefulWidget {
  const MainPageView1({super.key});

  @override
  State<MainPageView1> createState() => _MainPageView1State();
}

/// TODO : img 문자열 경로 따로 분리
class _MainPageView1State extends State<MainPageView1> {
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

  @override
  void initState() {
    print("INIT");
    run();
    super.initState();
  }

  void run() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      this
          .pageController
          .nextPage(duration: Duration(seconds: 1), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    this.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 배너, 이용권 화면
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(child: banner(bannerModel)),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketPage()),
                );
              },
              child: PageView(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: DARK_GREY_COLOR),
                      borderRadius: BorderRadius.circular(20.0),
                      color: LIGHT_GREY_COLOR,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            margin: EdgeInsets.only(top: 100.0),
                            width: MediaQuery.of(context).size.width,
                            child: Icon(
                              Icons.add_card,
                              color: Colors.black26,
                              size: 150.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "스티디룸 예약",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: DARK_GREY_COLOR,
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
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                            ],
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
            //width: 380.0,
            height: 90.0,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            color: Colors.blue,
            child: PageView.builder(
              onPageChanged: (int index) {
                this.pageIndex = index % bannerModel.items.length;
              },
              controller: pageController,
              //itemCount: model.items.length,
              itemBuilder: (BuildContext context, int index) {
                final pageIndex = index % bannerModel.items.length;
                final BannerItemModel item = model.items[pageIndex];
                final BannerItemModel(:img) = item;
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

/// TODO: 배너 이미지, 배너 메뉴 클래스 분리된 거 리펙토링
// class BannerMenuModeltmp {
//  final String txt;
//   final String img;
//   BannerMenuModeltmp({required this.img, required this.txt});
// }
// List<BannerMenuModeltmp> bannerlist = [BannerMenuModel(txt,img) ,BannerMenuModel(txt,img),..]
