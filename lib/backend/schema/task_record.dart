import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskRecord extends FirestoreRecord {
  TaskRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "task_name" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "task_desc" field.
  String? _taskDesc;
  String get taskDesc => _taskDesc ?? '';
  bool hasTaskDesc() => _taskDesc != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _taskName = snapshotData['task_name'] as String?;
    _taskDesc = snapshotData['task_desc'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _completed = castToType<int>(snapshotData['completed']);
    _taskCreator = snapshotData['task_creator'] as DocumentReference?;
    _taskTeam = getDataList(snapshotData['task_team']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('task')
          : FirebaseFirestore.instance.collectionGroup('task');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('task').doc(id);

  static Stream<TaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskRecord.fromSnapshot(s));

  static Future<TaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskRecord.fromSnapshot(s));

  static TaskRecord fromSnapshot(DocumentSnapshot snapshot) => TaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskRecordData({
  String? taskName,
  String? taskDesc,
  DateTime? startDate,
  DateTime? endDate,
  int? completed,
  DocumentReference? taskCreator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'task_name': taskName,
      'task_desc': taskDesc,
      'start_date': startDate,
      'end_date': endDate,
      'completed': completed,
      'task_creator': taskCreator,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskRecordDocumentEquality implements Equality<TaskRecord> {
  const TaskRecordDocumentEquality();

  @override
  bool equals(TaskRecord? e1, TaskRecord? e2) {
    const listEquality = ListEquality();
    return e1?.taskName == e2?.taskName &&
        e1?.taskDesc == e2?.taskDesc &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.completed == e2?.completed &&
        e1?.taskCreator == e2?.taskCreator &&
        listEquality.equals(e1?.taskTeam, e2?.taskTeam);
  }

  @override
  int hash(TaskRecord? e) => const ListEquality().hash([
        e?.taskName,
        e?.taskDesc,
        e?.startDate,
        e?.endDate,
        e?.completed,
        e?.taskCreator,
        e?.taskTeam
      ]);

  @override
  bool isValidKey(Object? o) => o is TaskRecord;
}
