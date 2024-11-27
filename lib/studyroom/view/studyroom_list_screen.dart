import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zeroplace/common/const/app_strings.dart';
import 'package:zeroplace/common/const/app_theme.dart';
import 'package:zeroplace/common/const/data.dart';
import 'package:zeroplace/common/layout/default_layout.dart';
import 'package:zeroplace/common/widgets/background.dart';
import 'package:zeroplace/studyroom/component/studyroom_card.dart';
import 'package:zeroplace/studyroom/model/studyroom.dart';

class StudyroomTicketList extends StatefulWidget {
  const StudyroomTicketList({super.key});

  @override
  State<StudyroomTicketList> createState() => _StudyroomTicketListState();
}

class _StudyroomTicketListState extends State<StudyroomTicketList> {
  String? selectedStudyroomId;

  Future<List> pagenateStudyroom() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await dio.get(
      'http://$ip/studyroom',
      options: Options(
        headers: {'authorization': 'Bearer $accessToken'},
      ),
    );

    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Background(children: [
              Text(
                AppStrings.pleaseChooseStudyroom,
                style: AppTheme.titleMiddle,
              ),
            ]),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FutureBuilder<List>(
                  future: pagenateStudyroom(),
                  builder: (context, AsyncSnapshot<List> snapshot) {
                    /// TODO : 데이터 상태에 따른 UI 생성
                    /// 1. 로딩 중인 경우
                    /// 2. 에러가 발생한 경우
                    /// 3. 데이터가 없는 경우
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    final List serverData = snapshot.data!;

                    return ListView.separated(
                      itemCount: serverData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = serverData[index];
                        final pItem = Studyroom.fromJson(json: item);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedStudyroomId = item.id;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Scaffold(),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: StudyroomCard(
                              studyroomName: pItem.studyroomName,
                              capacity: pItem.capacity,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 8.0,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
