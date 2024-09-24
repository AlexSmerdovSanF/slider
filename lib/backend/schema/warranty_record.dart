import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WarrantyRecord extends FirestoreRecord {
  WarrantyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "itemRef" field.
  DocumentReference? _itemRef;
  DocumentReference? get itemRef => _itemRef;
  bool hasItemRef() => _itemRef != null;

  // "statuseRef" field.
  DocumentReference? _statuseRef;
  DocumentReference? get statuseRef => _statuseRef;
  bool hasStatuseRef() => _statuseRef != null;

  // "dateCreate" field.
  DateTime? _dateCreate;
  DateTime? get dateCreate => _dateCreate;
  bool hasDateCreate() => _dateCreate != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "photoItems" field.
  List<String>? _photoItems;
  List<String> get photoItems => _photoItems ?? const [];
  bool hasPhotoItems() => _photoItems != null;

  // "photoCheck" field.
  List<String>? _photoCheck;
  List<String> get photoCheck => _photoCheck ?? const [];
  bool hasPhotoCheck() => _photoCheck != null;

  // "photoReview" field.
  List<String>? _photoReview;
  List<String> get photoReview => _photoReview ?? const [];
  bool hasPhotoReview() => _photoReview != null;

  // "itemTitle" field.
  String? _itemTitle;
  String get itemTitle => _itemTitle ?? '';
  bool hasItemTitle() => _itemTitle != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "isClosed" field.
  bool? _isClosed;
  bool get isClosed => _isClosed ?? false;
  bool hasIsClosed() => _isClosed != null;

  void _initializeFields() {
    _itemRef = snapshotData['itemRef'] as DocumentReference?;
    _statuseRef = snapshotData['statuseRef'] as DocumentReference?;
    _dateCreate = snapshotData['dateCreate'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _id = castToType<int>(snapshotData['id']);
    _comment = snapshotData['comment'] as String?;
    _photoItems = getDataList(snapshotData['photoItems']);
    _photoCheck = getDataList(snapshotData['photoCheck']);
    _photoReview = getDataList(snapshotData['photoReview']);
    _itemTitle = snapshotData['itemTitle'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _isClosed = snapshotData['isClosed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('warranty');

  static Stream<WarrantyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WarrantyRecord.fromSnapshot(s));

  static Future<WarrantyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WarrantyRecord.fromSnapshot(s));

  static WarrantyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WarrantyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WarrantyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WarrantyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WarrantyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WarrantyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWarrantyRecordData({
  DocumentReference? itemRef,
  DocumentReference? statuseRef,
  DateTime? dateCreate,
  DocumentReference? userRef,
  int? id,
  String? comment,
  String? itemTitle,
  bool? isActive,
  bool? isClosed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemRef': itemRef,
      'statuseRef': statuseRef,
      'dateCreate': dateCreate,
      'userRef': userRef,
      'id': id,
      'comment': comment,
      'itemTitle': itemTitle,
      'isActive': isActive,
      'isClosed': isClosed,
    }.withoutNulls,
  );

  return firestoreData;
}

class WarrantyRecordDocumentEquality implements Equality<WarrantyRecord> {
  const WarrantyRecordDocumentEquality();

  @override
  bool equals(WarrantyRecord? e1, WarrantyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemRef == e2?.itemRef &&
        e1?.statuseRef == e2?.statuseRef &&
        e1?.dateCreate == e2?.dateCreate &&
        e1?.userRef == e2?.userRef &&
        e1?.id == e2?.id &&
        e1?.comment == e2?.comment &&
        listEquality.equals(e1?.photoItems, e2?.photoItems) &&
        listEquality.equals(e1?.photoCheck, e2?.photoCheck) &&
        listEquality.equals(e1?.photoReview, e2?.photoReview) &&
        e1?.itemTitle == e2?.itemTitle &&
        e1?.isActive == e2?.isActive &&
        e1?.isClosed == e2?.isClosed;
  }

  @override
  int hash(WarrantyRecord? e) => const ListEquality().hash([
        e?.itemRef,
        e?.statuseRef,
        e?.dateCreate,
        e?.userRef,
        e?.id,
        e?.comment,
        e?.photoItems,
        e?.photoCheck,
        e?.photoReview,
        e?.itemTitle,
        e?.isActive,
        e?.isClosed
      ]);

  @override
  bool isValidKey(Object? o) => o is WarrantyRecord;
}
