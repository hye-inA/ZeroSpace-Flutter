class Studyroom {
  /// 1 ) 식별 가능한 ID
  final int id;

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
}
