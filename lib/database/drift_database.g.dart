// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'drift_database.dart';
//
// // ignore_for_file: type=lint
// class $ReservationTable extends Reservation
//     with TableInfo<$ReservationTable, ReservationData> {
//   @override
//   final GeneratedDatabase attachedDatabase;
//   final String? _alias;
//   $ReservationTable(this.attachedDatabase, [this._alias]);
//   static const VerificationMeta _idMeta = const VerificationMeta('id');
//   @override
//   late final GeneratedColumn<int> id = GeneratedColumn<int>(
//       'id', aliasedName, false,
//       hasAutoIncrement: true,
//       type: DriftSqlType.int,
//       requiredDuringInsert: false,
//       defaultConstraints:
//           GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
//   static const VerificationMeta _userNameMeta =
//       const VerificationMeta('userName');
//   @override
//   late final GeneratedColumn<String> userName = GeneratedColumn<String>(
//       'user_name', aliasedName, false,
//       type: DriftSqlType.string, requiredDuringInsert: true);
//   static const VerificationMeta _studyroomNameMeta =
//       const VerificationMeta('studyroomName');
//   @override
//   late final GeneratedColumn<String> studyroomName = GeneratedColumn<String>(
//       'studyroom_name', aliasedName, false,
//       type: DriftSqlType.string, requiredDuringInsert: true);
//   static const VerificationMeta _startTimeMeta =
//       const VerificationMeta('startTime');
//   @override
//   late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
//       'start_time', aliasedName, false,
//       type: DriftSqlType.int, requiredDuringInsert: true);
//   static const VerificationMeta _endTimeMeta =
//       const VerificationMeta('endTime');
//   @override
//   late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
//       'end_time', aliasedName, false,
//       type: DriftSqlType.int, requiredDuringInsert: true);
//   @override
//   List<GeneratedColumn> get $columns =>
//       [id, userName, studyroomName, startTime, endTime];
//   @override
//   String get aliasedName => _alias ?? actualTableName;
//   @override
//   String get actualTableName => $name;
//   static const String $name = 'reservation';
//   @override
//   VerificationContext validateIntegrity(Insertable<ReservationData> instance,
//       {bool isInserting = false}) {
//     final context = VerificationContext();
//     final data = instance.toColumns(true);
//     if (data.containsKey('id')) {
//       context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
//     }
//     if (data.containsKey('user_name')) {
//       context.handle(_userNameMeta,
//           userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
//     } else if (isInserting) {
//       context.missing(_userNameMeta);
//     }
//     if (data.containsKey('studyroom_name')) {
//       context.handle(
//           _studyroomNameMeta,
//           studyroomName.isAcceptableOrUnknown(
//               data['studyroom_name']!, _studyroomNameMeta));
//     } else if (isInserting) {
//       context.missing(_studyroomNameMeta);
//     }
//     if (data.containsKey('start_time')) {
//       context.handle(_startTimeMeta,
//           startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
//     } else if (isInserting) {
//       context.missing(_startTimeMeta);
//     }
//     if (data.containsKey('end_time')) {
//       context.handle(_endTimeMeta,
//           endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
//     } else if (isInserting) {
//       context.missing(_endTimeMeta);
//     }
//     return context;
//   }
//
//   @override
//   Set<GeneratedColumn> get $primaryKey => {id};
//   @override
//   ReservationData map(Map<String, dynamic> data, {String? tablePrefix}) {
//     final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
//     return ReservationData(
//       id: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
//       userName: attachedDatabase.typeMapping
//           .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
//       studyroomName: attachedDatabase.typeMapping
//           .read(DriftSqlType.string, data['${effectivePrefix}studyroom_name'])!,
//       startTime: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
//       endTime: attachedDatabase.typeMapping
//           .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
//     );
//   }
//
//   @override
//   $ReservationTable createAlias(String alias) {
//     return $ReservationTable(attachedDatabase, alias);
//   }
// }
//
// class ReservationData extends DataClass implements Insertable<ReservationData> {
//   final int id;
//   final String userName;
//   final String studyroomName;
//   final int startTime;
//   final int endTime;
//   const ReservationData(
//       {required this.id,
//       required this.userName,
//       required this.studyroomName,
//       required this.startTime,
//       required this.endTime});
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     map['id'] = Variable<int>(id);
//     map['user_name'] = Variable<String>(userName);
//     map['studyroom_name'] = Variable<String>(studyroomName);
//     map['start_time'] = Variable<int>(startTime);
//     map['end_time'] = Variable<int>(endTime);
//     return map;
//   }
//
//   ReservationCompanion toCompanion(bool nullToAbsent) {
//     return ReservationCompanion(
//       id: Value(id),
//       userName: Value(userName),
//       studyroomName: Value(studyroomName),
//       startTime: Value(startTime),
//       endTime: Value(endTime),
//     );
//   }
//
//   factory ReservationData.fromJson(Map<String, dynamic> json,
//       {ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return ReservationData(
//       id: serializer.fromJson<int>(json['id']),
//       userName: serializer.fromJson<String>(json['userName']),
//       studyroomName: serializer.fromJson<String>(json['studyroomName']),
//       startTime: serializer.fromJson<int>(json['startTime']),
//       endTime: serializer.fromJson<int>(json['endTime']),
//     );
//   }
//   @override
//   Map<String, dynamic> toJson({ValueSerializer? serializer}) {
//     serializer ??= driftRuntimeOptions.defaultSerializer;
//     return <String, dynamic>{
//       'id': serializer.toJson<int>(id),
//       'userName': serializer.toJson<String>(userName),
//       'studyroomName': serializer.toJson<String>(studyroomName),
//       'startTime': serializer.toJson<int>(startTime),
//       'endTime': serializer.toJson<int>(endTime),
//     };
//   }
//
//   ReservationData copyWith(
//           {int? id,
//           String? userName,
//           String? studyroomName,
//           int? startTime,
//           int? endTime}) =>
//       ReservationData(
//         id: id ?? this.id,
//         userName: userName ?? this.userName,
//         studyroomName: studyroomName ?? this.studyroomName,
//         startTime: startTime ?? this.startTime,
//         endTime: endTime ?? this.endTime,
//       );
//   @override
//   String toString() {
//     return (StringBuffer('ReservationData(')
//           ..write('id: $id, ')
//           ..write('userName: $userName, ')
//           ..write('studyroomName: $studyroomName, ')
//           ..write('startTime: $startTime, ')
//           ..write('endTime: $endTime')
//           ..write(')'))
//         .toString();
//   }
//
//   @override
//   int get hashCode =>
//       Object.hash(id, userName, studyroomName, startTime, endTime);
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is ReservationData &&
//           other.id == this.id &&
//           other.userName == this.userName &&
//           other.studyroomName == this.studyroomName &&
//           other.startTime == this.startTime &&
//           other.endTime == this.endTime);
// }
//
// class ReservationCompanion extends UpdateCompanion<ReservationData> {
//   final Value<int> id;
//   final Value<String> userName;
//   final Value<String> studyroomName;
//   final Value<int> startTime;
//   final Value<int> endTime;
//   const ReservationCompanion({
//     this.id = const Value.absent(),
//     this.userName = const Value.absent(),
//     this.studyroomName = const Value.absent(),
//     this.startTime = const Value.absent(),
//     this.endTime = const Value.absent(),
//   });
//   ReservationCompanion.insert({
//     this.id = const Value.absent(),
//     required String userName,
//     required String studyroomName,
//     required int startTime,
//     required int endTime,
//   })  : userName = Value(userName),
//         studyroomName = Value(studyroomName),
//         startTime = Value(startTime),
//         endTime = Value(endTime);
//   static Insertable<ReservationData> custom({
//     Expression<int>? id,
//     Expression<String>? userName,
//     Expression<String>? studyroomName,
//     Expression<int>? startTime,
//     Expression<int>? endTime,
//   }) {
//     return RawValuesInsertable({
//       if (id != null) 'id': id,
//       if (userName != null) 'user_name': userName,
//       if (studyroomName != null) 'studyroom_name': studyroomName,
//       if (startTime != null) 'start_time': startTime,
//       if (endTime != null) 'end_time': endTime,
//     });
//   }
//
//   ReservationCompanion copyWith(
//       {Value<int>? id,
//       Value<String>? userName,
//       Value<String>? studyroomName,
//       Value<int>? startTime,
//       Value<int>? endTime}) {
//     return ReservationCompanion(
//       id: id ?? this.id,
//       userName: userName ?? this.userName,
//       studyroomName: studyroomName ?? this.studyroomName,
//       startTime: startTime ?? this.startTime,
//       endTime: endTime ?? this.endTime,
//     );
//   }
//
//   @override
//   Map<String, Expression> toColumns(bool nullToAbsent) {
//     final map = <String, Expression>{};
//     if (id.present) {
//       map['id'] = Variable<int>(id.value);
//     }
//     if (userName.present) {
//       map['user_name'] = Variable<String>(userName.value);
//     }
//     if (studyroomName.present) {
//       map['studyroom_name'] = Variable<String>(studyroomName.value);
//     }
//     if (startTime.present) {
//       map['start_time'] = Variable<int>(startTime.value);
//     }
//     if (endTime.present) {
//       map['end_time'] = Variable<int>(endTime.value);
//     }
//     return map;
//   }
//
//   @override
//   String toString() {
//     return (StringBuffer('ReservationCompanion(')
//           ..write('id: $id, ')
//           ..write('userName: $userName, ')
//           ..write('studyroomName: $studyroomName, ')
//           ..write('startTime: $startTime, ')
//           ..write('endTime: $endTime')
//           ..write(')'))
//         .toString();
//   }
// }
//
// abstract class _$LocalDatabase extends GeneratedDatabase {
//   _$LocalDatabase(QueryExecutor e) : super(e);
//   late final $ReservationTable reservation = $ReservationTable(this);
//   @override
//   Iterable<TableInfo<Table, Object?>> get allTables =>
//       allSchemaEntities.whereType<TableInfo<Table, Object?>>();
//   @override
//   List<DatabaseSchemaEntity> get allSchemaEntities => [reservation];
// }
