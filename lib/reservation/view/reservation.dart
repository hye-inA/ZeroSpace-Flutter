import 'package:drift/drift.dart';

class Reservation extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get studyroomName => text()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();
}
