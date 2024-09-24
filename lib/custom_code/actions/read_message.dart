// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future readMessage(List<DocumentReference>? docArray) async {
  // The input is a DocumentReference array "docArray" ("message", list), the function in each document of the array in the isReaded field is set to true
  if (docArray != null) {
    for (DocumentReference docRef in docArray) {
      await docRef.update({'isReaded': true});
    }
  }
}
