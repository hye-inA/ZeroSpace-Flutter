class Reservation {
  /// 1 ) 식별 가능한 ID
  final int id;

  /// 2 ) 시작 시간
  final int startTime;

  /// 3 ) 종료 시간
  final int endTime;

  /// 4 ) 스터디룸 이름
  final String studyroomName;

  /// 5 ) 사용지 이름
  final String memberName;

  /// 6 ) 날짜
  final DateTime date;

  /// 7 ) 예약 생성 날짜
  final DateTime createdAt;

  Reservation({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.studyroomName,
    required this.memberName,
    required this.date,
    required this.createdAt,
  });
}
