import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannersRecord extends FirestoreRecord {
  BannersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "discountPercent" field.
  int? _discountPercent;
  int get discountPercent => _discountPercent ?? 0;
  bool hasDiscountPercent() => _discountPercent != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isBig" field.
  bool? _isBig;
  bool get isBig => _isBig ?? false;
  bool hasIsBig() => _isBig != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "isMedium" field.
  bool? _isMedium;
  bool get isMedium => _isMedium ?? false;
  bool hasIsMedium() => _isMedium != null;

  // "isSmall" field.
  bool? _isSmall;
  bool get isSmall => _isSmall ?? false;
  bool hasIsSmall() => _isSmall != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _discountPercent = castToType<int>(snapshotData['discountPercent']);
    _image = snapshotData['image'] as String?;
    _isBig = snapshotData['isBig'] as bool?;
    _link = snapshotData['link'] as String?;
    _isMedium = snapshotData['isMedium'] as bool?;
    _isSmall = snapshotData['isSmall'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banners');

  static Stream<BannersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannersRecord.fromSnapshot(s));

  static Future<BannersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannersRecord.fromSnapshot(s));

  static BannersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannersRecordData({
  String? title,
  int? discountPercent,
  String? image,
  bool? isBig,
  String? link,
  bool? isMedium,
  bool? isSmall,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'discountPercent': discountPercent,
      'image': image,
      'isBig': isBig,
      'link': link,
      'isMedium': isMedium,
      'isSmall': isSmall,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannersRecordDocumentEquality implements Equality<BannersRecord> {
  const BannersRecordDocumentEquality();

  @override
  bool equals(BannersRecord? e1, BannersRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.discountPercent == e2?.discountPercent &&
        e1?.image == e2?.image &&
        e1?.isBig == e2?.isBig &&
        e1?.link == e2?.link &&
        e1?.isMedium == e2?.isMedium &&
        e1?.isSmall == e2?.isSmall;
  }

  @override
  int hash(BannersRecord? e) => const ListEquality().hash([
        e?.title,
        e?.discountPercent,
        e?.image,
        e?.isBig,
        e?.link,
        e?.isMedium,
        e?.isSmall
      ]);

  @override
  bool isValidKey(Object? o) => o is BannersRecord;
}
