import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainpage_widget.dart' show MainpageWidget;
import 'package:flutter/material.dart';

class MainpageModel extends FlutterFlowModel<MainpageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in mainpage widget.
  List<MessageRecord>? unreadedMessages;
  // Stores action output result for [Firestore Query - Query a collection] action in mainpage widget.
  List<ItemsRecord>? searchPriceMain;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Checkbox widget.
  Map<CategoryRecord, bool> checkboxValueMap1 = {};
  List<CategoryRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for TextFieldPriceMIn widget.
  FocusNode? textFieldPriceMInFocusNode;
  TextEditingController? textFieldPriceMInTextController;
  String? Function(BuildContext, String?)?
      textFieldPriceMInTextControllerValidator;
  // State field(s) for TextFieldPriceMax widget.
  FocusNode? textFieldPriceMaxFocusNode;
  TextEditingController? textFieldPriceMaxTextController;
  String? Function(BuildContext, String?)?
      textFieldPriceMaxTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldPriceMInFocusNode?.dispose();
    textFieldPriceMInTextController?.dispose();

    textFieldPriceMaxFocusNode?.dispose();
    textFieldPriceMaxTextController?.dispose();
  }
}
