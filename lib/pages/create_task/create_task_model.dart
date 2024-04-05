import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_task_widget.dart' show CreateTaskWidget;
import 'package:flutter/material.dart';

class CreateTaskModel extends FlutterFlowModel<CreateTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name_Create widget.
  FocusNode? nameCreateFocusNode;
  TextEditingController? nameCreateController;
  String? Function(BuildContext, String?)? nameCreateControllerValidator;
  // State field(s) for desc_Create widget.
  FocusNode? descCreateFocusNode;
  TextEditingController? descCreateController;
  String? Function(BuildContext, String?)? descCreateControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TasksRecord? newTask;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameCreateFocusNode?.dispose();
    nameCreateController?.dispose();

    descCreateFocusNode?.dispose();
    descCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
