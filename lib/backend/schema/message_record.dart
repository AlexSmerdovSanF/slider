import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isReaded" field.
  bool? _isReaded;
  bool get isReaded => _isReaded ?? false;
  bool hasIsReaded() => _isReaded != null;

  void _initializeFields() {
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _isReaded = snapshotData['isReaded'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  DocumentReference? chatRef,
  String? text,
  DocumentReference? owner,
  DateTime? date,
  String? image,
  bool? isReaded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chatRef': chatRef,
      'text': text,
      'owner': owner,
      'date': date,
      'image': image,
      'isReaded': isReaded,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.chatRef == e2?.chatRef &&
        e1?.text == e2?.text &&
        e1?.owner == e2?.owner &&
        e1?.date == e2?.date &&
        e1?.image == e2?.image &&
        e1?.isReaded == e2?.isReaded;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality()
      .hash([e?.chatRef, e?.text, e?.owner, e?.date, e?.image, e?.isReaded]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
