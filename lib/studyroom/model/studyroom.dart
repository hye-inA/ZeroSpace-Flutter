class Studyroom {
  /// 1 ) 식별 가능한 ID
  final String id;

  /// 2 ) 스터디룸 이름
  final String studyroomName;

  /// 3 ) 수용 인원
  final int capacity;

  // /// 4 ) 스터디룸 생성일자
  // final DateTime createdAt;

  Studyroom({
    required this.id,
    required this.studyroomName,
    required this.capacity,
    //required this.createdAt,
  });

  factory Studyroom.fromJson({
    required Map<String, dynamic> json,
  }) {
    return Studyroom(
      id: json['id'],
      studyroomName: json['studyroomName'],
      capacity: json['capacity'],
    );
  }
}
