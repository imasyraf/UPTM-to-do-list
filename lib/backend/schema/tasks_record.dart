import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "taskDescription" field.
  String? _taskDescription;
  String get taskDescription => _taskDescription ?? '';
  bool hasTaskDescription() => _taskDescription != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "completed" field.
  int? _completed;
  int get completed => _completed ?? 0;
  bool hasCompleted() => _completed != null;

  // "task_creator" field.
  DocumentReference? _taskCreator;
  DocumentReference? get taskCreator => _taskCreator;
  bool hasTaskCreator() => _taskCreator != null;

  // "task_team" field.
  List<DocumentReference>? _taskTeam;
  List<DocumentReference> get taskTeam => _taskTeam ?? const [];
  bool hasTaskTeam() => _taskTeam != null;

  void _initializeFields() {
    _taskName = snapshotData['taskName'] as String?;
    _taskDescription = snapshotData['taskDescription'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _completed = castToType<int>(snapshotData['completed']);
    _taskCreator = snapshotData['task_creator'] as DocumentReference?;
    _taskTeam = getDataList(snapshotData['task_team']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? taskName,
  String? taskDescription,
  DateTime? startDate,
  DateTime? endDate,
  int? completed,
  DocumentReference? taskCreator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskName': taskName,
      'taskDescription': taskDescription,
      'start_date': startDate,
      'end_date': endDate,
      'completed': completed,
      'task_creator': taskCreator,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.taskName == e2?.taskName &&
        e1?.taskDescription == e2?.taskDescription &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.completed == e2?.completed &&
        e1?.taskCreator == e2?.taskCreator &&
        listEquality.equals(e1?.taskTeam, e2?.taskTeam);
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.taskName,
        e?.taskDescription,
        e?.startDate,
        e?.endDate,
        e?.completed,
        e?.taskCreator,
        e?.taskTeam
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
