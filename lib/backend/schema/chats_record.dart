import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

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

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "statuseRef" field.
  DocumentReference? _statuseRef;
  DocumentReference? get statuseRef => _statuseRef;
  bool hasStatuseRef() => _statuseRef != null;

  // "isApproved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "isCanceled" field.
  bool? _isCanceled;
  bool get isCanceled => _isCanceled ?? false;
  bool hasIsCanceled() => _isCanceled != null;

  // "isClosed" field.
  bool? _isClosed;
  bool get isClosed => _isClosed ?? false;
  bool hasIsClosed() => _isClosed != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _photoItems = getDataList(snapshotData['photoItems']);
    _photoCheck = getDataList(snapshotData['photoCheck']);
    _photoReview = getDataList(snapshotData['photoReview']);
    _id = castToType<int>(snapshotData['id']);
    _comment = snapshotData['comment'] as String?;
    _statuseRef = snapshotData['statuseRef'] as DocumentReference?;
    _isApproved = snapshotData['isApproved'] as bool?;
    _isCanceled = snapshotData['isCanceled'] as bool?;
    _isClosed = snapshotData['isClosed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DateTime? date,
  DocumentReference? owner,
  int? id,
  String? comment,
  DocumentReference? statuseRef,
  bool? isApproved,
  bool? isCanceled,
  bool? isClosed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'owner': owner,
      'id': id,
      'comment': comment,
      'statuseRef': statuseRef,
      'isApproved': isApproved,
      'isCanceled': isCanceled,
      'isClosed': isClosed,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.photoItems, e2?.photoItems) &&
        listEquality.equals(e1?.photoCheck, e2?.photoCheck) &&
        listEquality.equals(e1?.photoReview, e2?.photoReview) &&
        e1?.id == e2?.id &&
        e1?.comment == e2?.comment &&
        e1?.statuseRef == e2?.statuseRef &&
        e1?.isApproved == e2?.isApproved &&
        e1?.isCanceled == e2?.isCanceled &&
        e1?.isClosed == e2?.isClosed;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.owner,
        e?.photoItems,
        e?.photoCheck,
        e?.photoReview,
        e?.id,
        e?.comment,
        e?.statuseRef,
        e?.isApproved,
        e?.isCanceled,
        e?.isClosed
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
