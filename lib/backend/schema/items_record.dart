import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "linkOzon" field.
  String? _linkOzon;
  String get linkOzon => _linkOzon ?? '';
  bool hasLinkOzon() => _linkOzon != null;

  // "linkWildberries" field.
  String? _linkWildberries;
  String get linkWildberries => _linkWildberries ?? '';
  bool hasLinkWildberries() => _linkWildberries != null;

  // "linkMegamarket" field.
  String? _linkMegamarket;
  String get linkMegamarket => _linkMegamarket ?? '';
  bool hasLinkMegamarket() => _linkMegamarket != null;

  // "Describe" field.
  String? _describe;
  String get describe => _describe ?? '';
  bool hasDescribe() => _describe != null;

  // "isPopular" field.
  bool? _isPopular;
  bool get isPopular => _isPopular ?? false;
  bool hasIsPopular() => _isPopular != null;

  // "dateCreate" field.
  DateTime? _dateCreate;
  DateTime? get dateCreate => _dateCreate;
  bool hasDateCreate() => _dateCreate != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "categoryRef" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "imageTitle" field.
  String? _imageTitle;
  String get imageTitle => _imageTitle ?? '';
  bool hasImageTitle() => _imageTitle != null;

  // "isOzon" field.
  bool? _isOzon;
  bool get isOzon => _isOzon ?? false;
  bool hasIsOzon() => _isOzon != null;

  // "isWildberries" field.
  bool? _isWildberries;
  bool get isWildberries => _isWildberries ?? false;
  bool hasIsWildberries() => _isWildberries != null;

  // "isMegamarket" field.
  bool? _isMegamarket;
  bool get isMegamarket => _isMegamarket ?? false;
  bool hasIsMegamarket() => _isMegamarket != null;

  // "isPopularEq1" field.
  int? _isPopularEq1;
  int get isPopularEq1 => _isPopularEq1 ?? 0;
  bool hasIsPopularEq1() => _isPopularEq1 != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _images = getDataList(snapshotData['images']);
    _linkOzon = snapshotData['linkOzon'] as String?;
    _linkWildberries = snapshotData['linkWildberries'] as String?;
    _linkMegamarket = snapshotData['linkMegamarket'] as String?;
    _describe = snapshotData['Describe'] as String?;
    _isPopular = snapshotData['isPopular'] as bool?;
    _dateCreate = snapshotData['dateCreate'] as DateTime?;
    _price = castToType<int>(snapshotData['price']);
    _categoryRef = snapshotData['categoryRef'] as DocumentReference?;
    _imageTitle = snapshotData['imageTitle'] as String?;
    _isOzon = snapshotData['isOzon'] as bool?;
    _isWildberries = snapshotData['isWildberries'] as bool?;
    _isMegamarket = snapshotData['isMegamarket'] as bool?;
    _isPopularEq1 = castToType<int>(snapshotData['isPopularEq1']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? title,
  String? linkOzon,
  String? linkWildberries,
  String? linkMegamarket,
  String? describe,
  bool? isPopular,
  DateTime? dateCreate,
  int? price,
  DocumentReference? categoryRef,
  String? imageTitle,
  bool? isOzon,
  bool? isWildberries,
  bool? isMegamarket,
  int? isPopularEq1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'linkOzon': linkOzon,
      'linkWildberries': linkWildberries,
      'linkMegamarket': linkMegamarket,
      'Describe': describe,
      'isPopular': isPopular,
      'dateCreate': dateCreate,
      'price': price,
      'categoryRef': categoryRef,
      'imageTitle': imageTitle,
      'isOzon': isOzon,
      'isWildberries': isWildberries,
      'isMegamarket': isMegamarket,
      'isPopularEq1': isPopularEq1,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.linkOzon == e2?.linkOzon &&
        e1?.linkWildberries == e2?.linkWildberries &&
        e1?.linkMegamarket == e2?.linkMegamarket &&
        e1?.describe == e2?.describe &&
        e1?.isPopular == e2?.isPopular &&
        e1?.dateCreate == e2?.dateCreate &&
        e1?.price == e2?.price &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.imageTitle == e2?.imageTitle &&
        e1?.isOzon == e2?.isOzon &&
        e1?.isWildberries == e2?.isWildberries &&
        e1?.isMegamarket == e2?.isMegamarket &&
        e1?.isPopularEq1 == e2?.isPopularEq1;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.images,
        e?.linkOzon,
        e?.linkWildberries,
        e?.linkMegamarket,
        e?.describe,
        e?.isPopular,
        e?.dateCreate,
        e?.price,
        e?.categoryRef,
        e?.imageTitle,
        e?.isOzon,
        e?.isWildberries,
        e?.isMegamarket,
        e?.isPopularEq1
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
