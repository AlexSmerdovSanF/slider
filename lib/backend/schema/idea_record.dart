import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdeaRecord extends FirestoreRecord {
  IdeaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "dateCreate" field.
  DateTime? _dateCreate;
  DateTime? get dateCreate => _dateCreate;
  bool hasDateCreate() => _dateCreate != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  bool hasPhoto() => _photo != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _dateCreate = snapshotData['dateCreate'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
    _name = snapshotData['name'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _photo = getDataList(snapshotData['photo']);
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('idea');

  static Stream<IdeaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdeaRecord.fromSnapshot(s));

  static Future<IdeaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdeaRecord.fromSnapshot(s));

  static IdeaRecord fromSnapshot(DocumentSnapshot snapshot) => IdeaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdeaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdeaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdeaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdeaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdeaRecordData({
  DocumentReference? userRef,
  DateTime? dateCreate,
  String? comment,
  String? name,
  String? lastName,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'dateCreate': dateCreate,
      'comment': comment,
      'name': name,
      'lastName': lastName,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdeaRecordDocumentEquality implements Equality<IdeaRecord> {
  const IdeaRecordDocumentEquality();

  @override
  bool equals(IdeaRecord? e1, IdeaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.dateCreate == e2?.dateCreate &&
        e1?.comment == e2?.comment &&
        e1?.name == e2?.name &&
        e1?.lastName == e2?.lastName &&
        listEquality.equals(e1?.photo, e2?.photo) &&
        e1?.email == e2?.email;
  }

  @override
  int hash(IdeaRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.dateCreate,
        e?.comment,
        e?.name,
        e?.lastName,
        e?.photo,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is IdeaRecord;
}
