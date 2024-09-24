import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "chatID" field.
  DocumentReference? _chatID;
  DocumentReference? get chatID => _chatID;
  bool hasChatID() => _chatID != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "isNotifEmail" field.
  bool? _isNotifEmail;
  bool get isNotifEmail => _isNotifEmail ?? false;
  bool hasIsNotifEmail() => _isNotifEmail != null;

  // "isNotifPush" field.
  bool? _isNotifPush;
  bool get isNotifPush => _isNotifPush ?? false;
  bool hasIsNotifPush() => _isNotifPush != null;

  // "isPhoneActivated" field.
  bool? _isPhoneActivated;
  bool get isPhoneActivated => _isPhoneActivated ?? false;
  bool hasIsPhoneActivated() => _isPhoneActivated != null;

  // "isWorker" field.
  bool? _isWorker;
  bool get isWorker => _isWorker ?? false;
  bool hasIsWorker() => _isWorker != null;

  // "tasks" field.
  List<String>? _tasks;
  List<String> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  // "isUnblocked" field.
  bool? _isUnblocked;
  bool get isUnblocked => _isUnblocked ?? false;
  bool hasIsUnblocked() => _isUnblocked != null;

  // "isGlobalAdmin" field.
  bool? _isGlobalAdmin;
  bool get isGlobalAdmin => _isGlobalAdmin ?? false;
  bool hasIsGlobalAdmin() => _isGlobalAdmin != null;

  // "nickName" field.
  String? _nickName;
  String get nickName => _nickName ?? '';
  bool hasNickName() => _nickName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _chatID = snapshotData['chatID'] as DocumentReference?;
    _lastName = snapshotData['lastName'] as String?;
    _isNotifEmail = snapshotData['isNotifEmail'] as bool?;
    _isNotifPush = snapshotData['isNotifPush'] as bool?;
    _isPhoneActivated = snapshotData['isPhoneActivated'] as bool?;
    _isWorker = snapshotData['isWorker'] as bool?;
    _tasks = getDataList(snapshotData['tasks']);
    _isUnblocked = snapshotData['isUnblocked'] as bool?;
    _isGlobalAdmin = snapshotData['isGlobalAdmin'] as bool?;
    _nickName = snapshotData['nickName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? chatID,
  String? lastName,
  bool? isNotifEmail,
  bool? isNotifPush,
  bool? isPhoneActivated,
  bool? isWorker,
  bool? isUnblocked,
  bool? isGlobalAdmin,
  String? nickName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'chatID': chatID,
      'lastName': lastName,
      'isNotifEmail': isNotifEmail,
      'isNotifPush': isNotifPush,
      'isPhoneActivated': isPhoneActivated,
      'isWorker': isWorker,
      'isUnblocked': isUnblocked,
      'isGlobalAdmin': isGlobalAdmin,
      'nickName': nickName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.chatID == e2?.chatID &&
        e1?.lastName == e2?.lastName &&
        e1?.isNotifEmail == e2?.isNotifEmail &&
        e1?.isNotifPush == e2?.isNotifPush &&
        e1?.isPhoneActivated == e2?.isPhoneActivated &&
        e1?.isWorker == e2?.isWorker &&
        listEquality.equals(e1?.tasks, e2?.tasks) &&
        e1?.isUnblocked == e2?.isUnblocked &&
        e1?.isGlobalAdmin == e2?.isGlobalAdmin &&
        e1?.nickName == e2?.nickName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.chatID,
        e?.lastName,
        e?.isNotifEmail,
        e?.isNotifPush,
        e?.isPhoneActivated,
        e?.isWorker,
        e?.tasks,
        e?.isUnblocked,
        e?.isGlobalAdmin,
        e?.nickName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
