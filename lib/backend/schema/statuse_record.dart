import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatuseRecord extends FirestoreRecord {
  StatuseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "colorText" field.
  Color? _colorText;
  Color? get colorText => _colorText;
  bool hasColorText() => _colorText != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _color = getSchemaColor(snapshotData['color']);
    _colorText = getSchemaColor(snapshotData['colorText']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('statuse');

  static Stream<StatuseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatuseRecord.fromSnapshot(s));

  static Future<StatuseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatuseRecord.fromSnapshot(s));

  static StatuseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StatuseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatuseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatuseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatuseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatuseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatuseRecordData({
  String? title,
  Color? color,
  Color? colorText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'color': color,
      'colorText': colorText,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatuseRecordDocumentEquality implements Equality<StatuseRecord> {
  const StatuseRecordDocumentEquality();

  @override
  bool equals(StatuseRecord? e1, StatuseRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.color == e2?.color &&
        e1?.colorText == e2?.colorText;
  }

  @override
  int hash(StatuseRecord? e) =>
      const ListEquality().hash([e?.title, e?.color, e?.colorText]);

  @override
  bool isValidKey(Object? o) => o is StatuseRecord;
}
