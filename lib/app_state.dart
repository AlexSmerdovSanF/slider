import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isItemLiked = prefs
              .getStringList('ff_isItemLiked')
              ?.map((path) => path.ref)
              .toList() ??
          _isItemLiked;
    });
    _safeInit(() {
      _listMessagesReaded = prefs
              .getStringList('ff_listMessagesReaded')
              ?.map((path) => path.ref)
              .toList() ??
          _listMessagesReaded;
    });
    _safeInit(() {
      _isAccCreated = prefs.getBool('ff_isAccCreated') ?? _isAccCreated;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _addPhotoItems = [];
  List<String> get addPhotoItems => _addPhotoItems;
  set addPhotoItems(List<String> value) {
    _addPhotoItems = value;
  }

  void addToAddPhotoItems(String value) {
    addPhotoItems.add(value);
  }

  void removeFromAddPhotoItems(String value) {
    addPhotoItems.remove(value);
  }

  void removeAtIndexFromAddPhotoItems(int index) {
    addPhotoItems.removeAt(index);
  }

  void updateAddPhotoItemsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addPhotoItems[index] = updateFn(_addPhotoItems[index]);
  }

  void insertAtIndexInAddPhotoItems(int index, String value) {
    addPhotoItems.insert(index, value);
  }

  List<String> _addPhotoCheck = [];
  List<String> get addPhotoCheck => _addPhotoCheck;
  set addPhotoCheck(List<String> value) {
    _addPhotoCheck = value;
  }

  void addToAddPhotoCheck(String value) {
    addPhotoCheck.add(value);
  }

  void removeFromAddPhotoCheck(String value) {
    addPhotoCheck.remove(value);
  }

  void removeAtIndexFromAddPhotoCheck(int index) {
    addPhotoCheck.removeAt(index);
  }

  void updateAddPhotoCheckAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addPhotoCheck[index] = updateFn(_addPhotoCheck[index]);
  }

  void insertAtIndexInAddPhotoCheck(int index, String value) {
    addPhotoCheck.insert(index, value);
  }

  List<String> _addPhotoReview = [];
  List<String> get addPhotoReview => _addPhotoReview;
  set addPhotoReview(List<String> value) {
    _addPhotoReview = value;
  }

  void addToAddPhotoReview(String value) {
    addPhotoReview.add(value);
  }

  void removeFromAddPhotoReview(String value) {
    addPhotoReview.remove(value);
  }

  void removeAtIndexFromAddPhotoReview(int index) {
    addPhotoReview.removeAt(index);
  }

  void updateAddPhotoReviewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addPhotoReview[index] = updateFn(_addPhotoReview[index]);
  }

  void insertAtIndexInAddPhotoReview(int index, String value) {
    addPhotoReview.insert(index, value);
  }

  DocumentReference? _statuseRef;
  DocumentReference? get statuseRef => _statuseRef;
  set statuseRef(DocumentReference? value) {
    _statuseRef = value;
  }

  bool _isWarrantyActive = true;
  bool get isWarrantyActive => _isWarrantyActive;
  set isWarrantyActive(bool value) {
    _isWarrantyActive = value;
  }

  bool _isWarrantyClosed = true;
  bool get isWarrantyClosed => _isWarrantyClosed;
  set isWarrantyClosed(bool value) {
    _isWarrantyClosed = value;
  }

  String _imageMessage = '';
  String get imageMessage => _imageMessage;
  set imageMessage(String value) {
    _imageMessage = value;
  }

  String _videoMessage = '';
  String get videoMessage => _videoMessage;
  set videoMessage(String value) {
    _videoMessage = value;
  }

  String _regName = '';
  String get regName => _regName;
  set regName(String value) {
    _regName = value;
  }

  String _regEmail = '';
  String get regEmail => _regEmail;
  set regEmail(String value) {
    _regEmail = value;
  }

  String _regPassword = '';
  String get regPassword => _regPassword;
  set regPassword(String value) {
    _regPassword = value;
  }

  String _regPasswordRepeat = '';
  String get regPasswordRepeat => _regPasswordRepeat;
  set regPasswordRepeat(String value) {
    _regPasswordRepeat = value;
  }

  bool _isCheckOn = false;
  bool get isCheckOn => _isCheckOn;
  set isCheckOn(bool value) {
    _isCheckOn = value;
  }

  int _currentPage = 3;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
  }

  String _myPhoto = '';
  String get myPhoto => _myPhoto;
  set myPhoto(String value) {
    _myPhoto = value;
  }

  String _userPhone = '';
  String get userPhone => _userPhone;
  set userPhone(String value) {
    _userPhone = value;
  }

  String _searchCatalog = '';
  String get searchCatalog => _searchCatalog;
  set searchCatalog(String value) {
    _searchCatalog = value;
  }

  String _selectCategory = '';
  String get selectCategory => _selectCategory;
  set selectCategory(String value) {
    _selectCategory = value;
  }

  String _selectShopString = '';
  String get selectShopString => _selectShopString;
  set selectShopString(String value) {
    _selectShopString = value;
  }

  double _selectPrice = 0.0;
  double get selectPrice => _selectPrice;
  set selectPrice(double value) {
    _selectPrice = value;
  }

  bool _isSearchOn = false;
  bool get isSearchOn => _isSearchOn;
  set isSearchOn(bool value) {
    _isSearchOn = value;
  }

  List<String> _selectedCats = [];
  List<String> get selectedCats => _selectedCats;
  set selectedCats(List<String> value) {
    _selectedCats = value;
  }

  void addToSelectedCats(String value) {
    selectedCats.add(value);
  }

  void removeFromSelectedCats(String value) {
    selectedCats.remove(value);
  }

  void removeAtIndexFromSelectedCats(int index) {
    selectedCats.removeAt(index);
  }

  void updateSelectedCatsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedCats[index] = updateFn(_selectedCats[index]);
  }

  void insertAtIndexInSelectedCats(int index, String value) {
    selectedCats.insert(index, value);
  }

  bool _isOzonSelected = false;
  bool get isOzonSelected => _isOzonSelected;
  set isOzonSelected(bool value) {
    _isOzonSelected = value;
  }

  bool _isWildberriesSelected = false;
  bool get isWildberriesSelected => _isWildberriesSelected;
  set isWildberriesSelected(bool value) {
    _isWildberriesSelected = value;
  }

  bool _isYandexSelected = false;
  bool get isYandexSelected => _isYandexSelected;
  set isYandexSelected(bool value) {
    _isYandexSelected = value;
  }

  List<DocumentReference> _selectedCatsRef = [];
  List<DocumentReference> get selectedCatsRef => _selectedCatsRef;
  set selectedCatsRef(List<DocumentReference> value) {
    _selectedCatsRef = value;
  }

  void addToSelectedCatsRef(DocumentReference value) {
    selectedCatsRef.add(value);
  }

  void removeFromSelectedCatsRef(DocumentReference value) {
    selectedCatsRef.remove(value);
  }

  void removeAtIndexFromSelectedCatsRef(int index) {
    selectedCatsRef.removeAt(index);
  }

  void updateSelectedCatsRefAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    selectedCatsRef[index] = updateFn(_selectedCatsRef[index]);
  }

  void insertAtIndexInSelectedCatsRef(int index, DocumentReference value) {
    selectedCatsRef.insert(index, value);
  }

  int _startMaxPrice = 0;
  int get startMaxPrice => _startMaxPrice;
  set startMaxPrice(int value) {
    _startMaxPrice = value;
  }

  int _startMinPrice = 0;
  int get startMinPrice => _startMinPrice;
  set startMinPrice(int value) {
    _startMinPrice = value;
  }

  int _selectedPriceMin = 0;
  int get selectedPriceMin => _selectedPriceMin;
  set selectedPriceMin(int value) {
    _selectedPriceMin = value;
  }

  int _selectedPriceMax = 0;
  int get selectedPriceMax => _selectedPriceMax;
  set selectedPriceMax(int value) {
    _selectedPriceMax = value;
  }

  List<String> _photoIdea = [];
  List<String> get photoIdea => _photoIdea;
  set photoIdea(List<String> value) {
    _photoIdea = value;
  }

  void addToPhotoIdea(String value) {
    photoIdea.add(value);
  }

  void removeFromPhotoIdea(String value) {
    photoIdea.remove(value);
  }

  void removeAtIndexFromPhotoIdea(int index) {
    photoIdea.removeAt(index);
  }

  void updatePhotoIdeaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    photoIdea[index] = updateFn(_photoIdea[index]);
  }

  void insertAtIndexInPhotoIdea(int index, String value) {
    photoIdea.insert(index, value);
  }

  List<DocumentReference> _isItemLiked = [];
  List<DocumentReference> get isItemLiked => _isItemLiked;
  set isItemLiked(List<DocumentReference> value) {
    _isItemLiked = value;
    prefs.setStringList('ff_isItemLiked', value.map((x) => x.path).toList());
  }

  void addToIsItemLiked(DocumentReference value) {
    isItemLiked.add(value);
    prefs.setStringList(
        'ff_isItemLiked', _isItemLiked.map((x) => x.path).toList());
  }

  void removeFromIsItemLiked(DocumentReference value) {
    isItemLiked.remove(value);
    prefs.setStringList(
        'ff_isItemLiked', _isItemLiked.map((x) => x.path).toList());
  }

  void removeAtIndexFromIsItemLiked(int index) {
    isItemLiked.removeAt(index);
    prefs.setStringList(
        'ff_isItemLiked', _isItemLiked.map((x) => x.path).toList());
  }

  void updateIsItemLikedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    isItemLiked[index] = updateFn(_isItemLiked[index]);
    prefs.setStringList(
        'ff_isItemLiked', _isItemLiked.map((x) => x.path).toList());
  }

  void insertAtIndexInIsItemLiked(int index, DocumentReference value) {
    isItemLiked.insert(index, value);
    prefs.setStringList(
        'ff_isItemLiked', _isItemLiked.map((x) => x.path).toList());
  }

  bool _isLikedShown = false;
  bool get isLikedShown => _isLikedShown;
  set isLikedShown(bool value) {
    _isLikedShown = value;
  }

  List<DocumentReference> _listMessagesReaded = [];
  List<DocumentReference> get listMessagesReaded => _listMessagesReaded;
  set listMessagesReaded(List<DocumentReference> value) {
    _listMessagesReaded = value;
    prefs.setStringList(
        'ff_listMessagesReaded', value.map((x) => x.path).toList());
  }

  void addToListMessagesReaded(DocumentReference value) {
    listMessagesReaded.add(value);
    prefs.setStringList('ff_listMessagesReaded',
        _listMessagesReaded.map((x) => x.path).toList());
  }

  void removeFromListMessagesReaded(DocumentReference value) {
    listMessagesReaded.remove(value);
    prefs.setStringList('ff_listMessagesReaded',
        _listMessagesReaded.map((x) => x.path).toList());
  }

  void removeAtIndexFromListMessagesReaded(int index) {
    listMessagesReaded.removeAt(index);
    prefs.setStringList('ff_listMessagesReaded',
        _listMessagesReaded.map((x) => x.path).toList());
  }

  void updateListMessagesReadedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    listMessagesReaded[index] = updateFn(_listMessagesReaded[index]);
    prefs.setStringList('ff_listMessagesReaded',
        _listMessagesReaded.map((x) => x.path).toList());
  }

  void insertAtIndexInListMessagesReaded(int index, DocumentReference value) {
    listMessagesReaded.insert(index, value);
    prefs.setStringList('ff_listMessagesReaded',
        _listMessagesReaded.map((x) => x.path).toList());
  }

  bool _isAppOpen = false;
  bool get isAppOpen => _isAppOpen;
  set isAppOpen(bool value) {
    _isAppOpen = value;
  }

  bool _isSortTrue = false;
  bool get isSortTrue => _isSortTrue;
  set isSortTrue(bool value) {
    _isSortTrue = value;
  }

  bool _isPopular = false;
  bool get isPopular => _isPopular;
  set isPopular(bool value) {
    _isPopular = value;
  }

  bool _isExpensive = false;
  bool get isExpensive => _isExpensive;
  set isExpensive(bool value) {
    _isExpensive = value;
  }

  bool _isCheaper = false;
  bool get isCheaper => _isCheaper;
  set isCheaper(bool value) {
    _isCheaper = value;
  }

  bool _isNovelty = false;
  bool get isNovelty => _isNovelty;
  set isNovelty(bool value) {
    _isNovelty = value;
  }

  bool _isAccCreated = false;
  bool get isAccCreated => _isAccCreated;
  set isAccCreated(bool value) {
    _isAccCreated = value;
    prefs.setBool('ff_isAccCreated', value);
  }

  String _phoneCode = '';
  String get phoneCode => _phoneCode;
  set phoneCode(String value) {
    _phoneCode = value;
  }

  DocumentReference? _docRefSupport;
  DocumentReference? get docRefSupport => _docRefSupport;
  set docRefSupport(DocumentReference? value) {
    _docRefSupport = value;
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  int _adminPage = 0;
  int get adminPage => _adminPage;
  set adminPage(int value) {
    _adminPage = value;
  }

  DocumentReference? _adminSelectedItem;
  DocumentReference? get adminSelectedItem => _adminSelectedItem;
  set adminSelectedItem(DocumentReference? value) {
    _adminSelectedItem = value;
  }

  DocumentReference? _adminSelectedStatuse;
  DocumentReference? get adminSelectedStatuse => _adminSelectedStatuse;
  set adminSelectedStatuse(DocumentReference? value) {
    _adminSelectedStatuse = value;
  }

  String _adminSelectedString = '';
  String get adminSelectedString => _adminSelectedString;
  set adminSelectedString(String value) {
    _adminSelectedString = value;
  }

  List<String> _adminPhotoItemCreate = [];
  List<String> get adminPhotoItemCreate => _adminPhotoItemCreate;
  set adminPhotoItemCreate(List<String> value) {
    _adminPhotoItemCreate = value;
  }

  void addToAdminPhotoItemCreate(String value) {
    adminPhotoItemCreate.add(value);
  }

  void removeFromAdminPhotoItemCreate(String value) {
    adminPhotoItemCreate.remove(value);
  }

  void removeAtIndexFromAdminPhotoItemCreate(int index) {
    adminPhotoItemCreate.removeAt(index);
  }

  void updateAdminPhotoItemCreateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adminPhotoItemCreate[index] = updateFn(_adminPhotoItemCreate[index]);
  }

  void insertAtIndexInAdminPhotoItemCreate(int index, String value) {
    adminPhotoItemCreate.insert(index, value);
  }

  List<String> _adminSelectedWorkerTasks = [];
  List<String> get adminSelectedWorkerTasks => _adminSelectedWorkerTasks;
  set adminSelectedWorkerTasks(List<String> value) {
    _adminSelectedWorkerTasks = value;
  }

  void addToAdminSelectedWorkerTasks(String value) {
    adminSelectedWorkerTasks.add(value);
  }

  void removeFromAdminSelectedWorkerTasks(String value) {
    adminSelectedWorkerTasks.remove(value);
  }

  void removeAtIndexFromAdminSelectedWorkerTasks(int index) {
    adminSelectedWorkerTasks.removeAt(index);
  }

  void updateAdminSelectedWorkerTasksAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adminSelectedWorkerTasks[index] =
        updateFn(_adminSelectedWorkerTasks[index]);
  }

  void insertAtIndexInAdminSelectedWorkerTasks(int index, String value) {
    adminSelectedWorkerTasks.insert(index, value);
  }

  bool _isEnterSignin = false;
  bool get isEnterSignin => _isEnterSignin;
  set isEnterSignin(bool value) {
    _isEnterSignin = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
