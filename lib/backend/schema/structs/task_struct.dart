// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskStruct extends FFFirebaseStruct {
  TaskStruct({
    String? taskName,
    String? taskDesc,
    DateTime? startDate,
    DateTime? endDate,
    int? completed,
    String? taskGroup,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _taskName = taskName,
        _taskDesc = taskDesc,
        _startDate = startDate,
        _endDate = endDate,
        _completed = completed,
        _taskGroup = taskGroup,
        super(firestoreUtilData);

  // "task_name" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  set taskName(String? val) => _taskName = val;
  bool hasTaskName() => _taskName != null;

  // "task_desc" field.
  String? _taskDesc;
  String get taskDesc => _taskDesc ?? '';
  set taskDesc(String? val) => _taskDesc = val;
  bool hasTaskDesc() => _taskDesc != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "completed" field.
  int? _completed;
  int get completed => _completed ?? 0;
  set completed(int? val) => _completed = val;
  void incrementCompleted(int amount) => _completed = completed + amount;
  bool hasCompleted() => _completed != null;

  // "taskGroup" field.
  String? _taskGroup;
  String get taskGroup => _taskGroup ?? '';
  set taskGroup(String? val) => _taskGroup = val;
  bool hasTaskGroup() => _taskGroup != null;

  static TaskStruct fromMap(Map<String, dynamic> data) => TaskStruct(
        taskName: data['task_name'] as String?,
        taskDesc: data['task_desc'] as String?,
        startDate: data['start_date'] as DateTime?,
        endDate: data['end_date'] as DateTime?,
        completed: castToType<int>(data['completed']),
        taskGroup: data['taskGroup'] as String?,
      );

  static TaskStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaskStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'task_name': _taskName,
        'task_desc': _taskDesc,
        'start_date': _startDate,
        'end_date': _endDate,
        'completed': _completed,
        'taskGroup': _taskGroup,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'task_name': serializeParam(
          _taskName,
          ParamType.String,
        ),
        'task_desc': serializeParam(
          _taskDesc,
          ParamType.String,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'completed': serializeParam(
          _completed,
          ParamType.int,
        ),
        'taskGroup': serializeParam(
          _taskGroup,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskStruct(
        taskName: deserializeParam(
          data['task_name'],
          ParamType.String,
          false,
        ),
        taskDesc: deserializeParam(
          data['task_desc'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.DateTime,
          false,
        ),
        completed: deserializeParam(
          data['completed'],
          ParamType.int,
          false,
        ),
        taskGroup: deserializeParam(
          data['taskGroup'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskStruct &&
        taskName == other.taskName &&
        taskDesc == other.taskDesc &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        completed == other.completed &&
        taskGroup == other.taskGroup;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([taskName, taskDesc, startDate, endDate, completed, taskGroup]);
}

TaskStruct createTaskStruct({
  String? taskName,
  String? taskDesc,
  DateTime? startDate,
  DateTime? endDate,
  int? completed,
  String? taskGroup,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskStruct(
      taskName: taskName,
      taskDesc: taskDesc,
      startDate: startDate,
      endDate: endDate,
      completed: completed,
      taskGroup: taskGroup,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TaskStruct? updateTaskStruct(
  TaskStruct? task, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    task
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTaskStructData(
  Map<String, dynamic> firestoreData,
  TaskStruct? task,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (task == null) {
    return;
  }
  if (task.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && task.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskData = getTaskFirestoreData(task, forFieldValue);
  final nestedData = taskData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = task.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTaskFirestoreData(
  TaskStruct? task, [
  bool forFieldValue = false,
]) {
  if (task == null) {
    return {};
  }
  final firestoreData = mapToFirestore(task.toMap());

  // Add any Firestore field values
  task.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskListFirestoreData(
  List<TaskStruct>? tasks,
) =>
    tasks?.map((e) => getTaskFirestoreData(e, true)).toList() ?? [];
