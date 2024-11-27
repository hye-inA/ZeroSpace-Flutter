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
  int? selectedStudyroomId;

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

  final List<Studyroom> studyrooms = [
    Studyroom(
      id: 1,
      studyroomName: '스터디룸1',
      capacity: 4,
    ),
    Studyroom(
      id: 2,
      studyroomName: '스터디룸2',
      capacity: 6,
    ),
  ];

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
                    print(snapshot.error);
                    print(snapshot.data);

                    return ListView.separated(
                      itemCount: studyrooms.length,
                      itemBuilder: (BuildContext context, int index) {
                        final studyroomModel = studyrooms[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedStudyroomId = studyroomModel.id;
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
                              studyroomName: studyroomModel.studyroomName,
                              capacity: studyroomModel.capacity,
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
