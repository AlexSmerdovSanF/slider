import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'mainpage_model.dart';
export 'mainpage_model.dart';

class MainpageWidget extends StatefulWidget {
  const MainpageWidget({super.key});

  @override
  State<MainpageWidget> createState() => _MainpageWidgetState();
}

class _MainpageWidgetState extends State<MainpageWidget> {
  late MainpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isAppOpen != true) {
        _model.unreadedMessages = await queryMessageRecordOnce(
          queryBuilder: (messageRecord) => messageRecord.where(
            'isReaded',
            isEqualTo: false,
          ),
        );
        FFAppState().listMessagesReaded = _model.unreadedMessages!
            .map((e) => e.reference)
            .toList()
            .toList()
            .cast<DocumentReference>();
        FFAppState().isAppOpen = true;
        safeSetState(() {});
      }
      FFAppState().searchText = '';
      FFAppState().searchCatalog = '';
      FFAppState().isOzonSelected = true;
      FFAppState().isWildberriesSelected = true;
      FFAppState().isYandexSelected = true;
      FFAppState().selectedCatsRef = [];
      FFAppState().isPopular = true;
      safeSetState(() {});
      FFAppState().isExpensive = false;
      FFAppState().isCheaper = false;
      FFAppState().isNovelty = false;
      safeSetState(() {});
      _model.searchPriceMain = await queryItemsRecordOnce(
        queryBuilder: (itemsRecord) => itemsRecord.orderBy('price'),
      );
      FFAppState().startMaxPrice = _model.searchPriceMain!.last.price;
      FFAppState().startMinPrice = _model.searchPriceMain!.first.price;
      FFAppState().selectedPriceMax = _model.searchPriceMain!.last.price;
      FFAppState().selectedPriceMin = _model.searchPriceMain!.first.price;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.textFieldPriceMInTextController ??= TextEditingController();
    _model.textFieldPriceMInFocusNode ??= FocusNode();

    _model.textFieldPriceMaxTextController ??= TextEditingController();
    _model.textFieldPriceMaxFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ItemsRecord>>(
      stream: queryItemsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFF7F7F7),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ItemsRecord> mainpageItemsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF7F7F7),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        height: 48.0,
                                        decoration: const BoxDecoration(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Каталог',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 29.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      valueOrDefault<double>(
                                                    () {
                                                      if (FFAppState()
                                                                  .searchText !=
                                                              '') {
                                                        return 0.0;
                                                      } else if (FFAppState()
                                                              .isSearchOn ==
                                                          true) {
                                                        return 0.0;
                                                      } else if (FFAppState()
                                                              .isSortTrue ==
                                                          true) {
                                                        return 0.0;
                                                      } else {
                                                        return 22.0;
                                                      }
                                                    }(),
                                                    0.0,
                                                  )),
                                                  bottomRight: Radius.circular(
                                                      valueOrDefault<double>(
                                                    () {
                                                      if (FFAppState()
                                                                  .searchText !=
                                                              '') {
                                                        return 0.0;
                                                      } else if (FFAppState()
                                                              .isSearchOn ==
                                                          true) {
                                                        return 0.0;
                                                      } else if (FFAppState()
                                                              .isSortTrue ==
                                                          true) {
                                                        return 0.0;
                                                      } else {
                                                        return 22.0;
                                                      }
                                                    }(),
                                                    0.0,
                                                  )),
                                                  topLeft:
                                                      const Radius.circular(22.0),
                                                  topRight:
                                                      const Radius.circular(22.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (FFAppState()
                                                                .searchText ==
                                                            '')
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .sistrix,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    6.0,
                                                                    8.0,
                                                                    14.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController1,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController1',
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
                                                            () async {
                                                              FFAppState()
                                                                      .searchText =
                                                                  _model
                                                                      .textController1
                                                                      .text;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            alignLabelWithHint:
                                                                true,
                                                            hintText: FFAppState()
                                                                            .searchCatalog ==
                                                                        ''
                                                                ? 'Я ищу...'
                                                                : FFAppState()
                                                                    .searchCatalog,
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            suffixIcon: _model
                                                                    .textController1!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model
                                                                          .textController1
                                                                          ?.clear();
                                                                      FFAppState()
                                                                              .searchText =
                                                                          _model
                                                                              .textController1
                                                                              .text;
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          12.0,
                                                                    ),
                                                                  )
                                                                : null,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          validator: _model
                                                              .textController1Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                                .searchCatalog !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .searchCatalog = '';
                                                            FFAppState()
                                                                .searchText = '';
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FFAppState()
                                                                          .isSearchOn ==
                                                                      false
                                                                  ? const Color(
                                                                      0xFFF7F7F7)
                                                                  : const Color(
                                                                      0xFFD2D2D3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons.close,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (FFAppState()
                                                                  .isSearchOn ==
                                                              true) {
                                                            FFAppState()
                                                                    .isSearchOn =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState()
                                                                    .isSearchOn =
                                                                true;
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppState()
                                                                        .isSearchOn ==
                                                                    false
                                                                ? const Color(
                                                                    0xFFF7F7F7)
                                                                : const Color(
                                                                    0xFFD2D2D3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: const FaIcon(
                                                            FontAwesomeIcons
                                                                .slidersH,
                                                            color: Color(
                                                                0xFF6E6C79),
                                                            size: 15.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (FFAppState()
                                                                  .isSortTrue ==
                                                              true) {
                                                            FFAppState()
                                                                    .isSortTrue =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState()
                                                                    .isSortTrue =
                                                                true;
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppState()
                                                                        .isSortTrue ==
                                                                    false
                                                                ? const Color(
                                                                    0xFFF7F7F7)
                                                                : const Color(
                                                                    0xFFD2D2D3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: const Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            7.0,
                                                                            6.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .north_outlined,
                                                                  color: Color(
                                                                      0xFF6E6C79),
                                                                  size: 15.0,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons.south,
                                                                  color: Color(
                                                                      0xFF6E6C79),
                                                                  size: 15.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if ((FFAppState().searchText !=
                                                        '') ||
                                                (FFAppState().isSearchOn ==
                                                    true) ||
                                                (FFAppState().isSortTrue ==
                                                    true))
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 42.0, 0.0, 0.0),
                                                child: StreamBuilder<
                                                    List<ItemsRecord>>(
                                                  stream: queryItemsRecord(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ItemsRecord>
                                                        containerItemsRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    8.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (FFAppState()
                                                                        .searchText !=
                                                                    '')
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        20.0,
                                                                        8.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final searchList = containerItemsRecordList
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList()
                                                                        .where((e) =>
                                                                            functions.searchInList(FFAppState().searchText,
                                                                                e.title) ==
                                                                            true)
                                                                        .toList();

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          searchList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              searchListIndex) {
                                                                        final searchListItem =
                                                                            searchList[searchListIndex];
                                                                        return Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().searchCatalog = searchListItem.title;
                                                                              FFAppState().searchText = '';
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                _model.textController1?.clear();
                                                                              });
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                if ((searchListItem.images.isNotEmpty) == true)
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      searchListItem.images.first,
                                                                                      width: 28.0,
                                                                                      height: 28.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    searchListItem.title,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            if (FFAppState()
                                                                    .isSearchOn ==
                                                                true)
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Категория',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        StreamBuilder<
                                                                            List<CategoryRecord>>(
                                                                          stream:
                                                                              queryCategoryRecord(),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<CategoryRecord>
                                                                                categoryCategoryRecordList =
                                                                                snapshot.data!;

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: categoryCategoryRecordList.length,
                                                                              itemBuilder: (context, categoryIndex) {
                                                                                final categoryCategoryRecord = categoryCategoryRecordList[categoryIndex];
                                                                                return StreamBuilder<CategoryRecord>(
                                                                                  stream: CategoryRecord.getDocument(categoryCategoryRecord.reference),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: CircularProgressIndicator(
                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    final rowCategoryRecord = snapshot.data!;

                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Theme(
                                                                                          data: ThemeData(
                                                                                            checkboxTheme: const CheckboxThemeData(
                                                                                              visualDensity: VisualDensity.compact,
                                                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                              shape: CircleBorder(),
                                                                                            ),
                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                          child: Checkbox(
                                                                                            value: _model.checkboxValueMap1[categoryCategoryRecord] ??= true,
                                                                                            onChanged: (newValue) async {
                                                                                              safeSetState(() => _model.checkboxValueMap1[categoryCategoryRecord] = newValue!);
                                                                                              if (newValue!) {
                                                                                                FFAppState().removeFromSelectedCatsRef(rowCategoryRecord.reference);
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                FFAppState().addToSelectedCatsRef(rowCategoryRecord.reference);
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                            },
                                                                                            side: BorderSide(
                                                                                              width: 2,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                            checkColor: FlutterFlowTheme.of(context).info,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          categoryCategoryRecord.title,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Цена',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: 132.0,
                                                                                      height: 48.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: const Color(0xFFF7F7F7),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: SizedBox(
                                                                                        width: 200.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.textFieldPriceMInTextController,
                                                                                          focusNode: _model.textFieldPriceMInFocusNode,
                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                            '_model.textFieldPriceMInTextController',
                                                                                            const Duration(milliseconds: 200),
                                                                                            () async {
                                                                                              FFAppState().selectedPriceMin = int.parse(_model.textFieldPriceMInTextController.text);
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                          ),
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            isDense: false,
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintText: FFAppState().selectedPriceMin != 0 ? FFAppState().selectedPriceMin.toString() : FFAppState().startMinPrice.toString(),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: const BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: const BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          textAlign: TextAlign.center,
                                                                                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          validator: _model.textFieldPriceMInTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 12.0,
                                                                                      height: 1.0,
                                                                                      decoration: const BoxDecoration(
                                                                                        color: Color(0xFFD2D2D3),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: 132.0,
                                                                                      height: 48.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: const Color(0xFFF7F7F7),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: SizedBox(
                                                                                        width: 200.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.textFieldPriceMaxTextController,
                                                                                          focusNode: _model.textFieldPriceMaxFocusNode,
                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                            '_model.textFieldPriceMaxTextController',
                                                                                            const Duration(milliseconds: 200),
                                                                                            () async {
                                                                                              FFAppState().selectedPriceMax = int.parse(_model.textFieldPriceMaxTextController.text);
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                          ),
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            isDense: false,
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            hintText: FFAppState().selectedPriceMax != 0 ? FFAppState().selectedPriceMax.toString() : FFAppState().startMaxPrice.toString(),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: const BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: const BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          textAlign: TextAlign.center,
                                                                                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          validator: _model.textFieldPriceMaxTextControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          child:
                                                                              custom_widgets.RangeXlider(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                100.0,
                                                                            max:
                                                                                FFAppState().startMaxPrice.toDouble(),
                                                                            min:
                                                                                FFAppState().startMinPrice.toDouble(),
                                                                            rangeSlider:
                                                                                true,
                                                                            step:
                                                                                5.0,
                                                                            alwaysShowTooltip:
                                                                                false,
                                                                            tooltipDisabled:
                                                                                false,
                                                                            tooltipDisabledAnimation:
                                                                                false,
                                                                            disabled:
                                                                                false,
                                                                            rtl:
                                                                                false,
                                                                            jump:
                                                                                false,
                                                                            selectByTap:
                                                                                false,
                                                                            lockHandlers:
                                                                                false,
                                                                            centeredOrigin:
                                                                                false,
                                                                            isVisibleTouchArea:
                                                                                false,
                                                                            isVertical:
                                                                                false,
                                                                            onDragStarted: (handlerIndex,
                                                                                lowerValue,
                                                                                upperValue) async {},
                                                                            onDragCompleted: (handlerIndex,
                                                                                lowerValue,
                                                                                upperValue) async {},
                                                                            onDragging: (handlerIndex,
                                                                                lowerValue,
                                                                                upperValue) async {
                                                                              safeSetState(() {
                                                                                _model.textFieldPriceMInTextController?.clear();
                                                                                _model.textFieldPriceMaxTextController?.clear();
                                                                              });
                                                                              FFAppState().selectedPriceMin = lowerValue;
                                                                              FFAppState().selectedPriceMax = upperValue;
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Маркетплейс',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: const CheckboxThemeData(
                                                                                      visualDensity: VisualDensity.compact,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      shape: CircleBorder(),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxValue2 ??= true,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.checkboxValue2 = newValue!);
                                                                                      if (newValue!) {
                                                                                        FFAppState().isOzonSelected = true;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        FFAppState().isOzonSelected = false;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    side: BorderSide(
                                                                                      width: 2,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Ozon',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: const CheckboxThemeData(
                                                                                      visualDensity: VisualDensity.compact,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      shape: CircleBorder(),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxValue3 ??= true,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.checkboxValue3 = newValue!);
                                                                                      if (newValue!) {
                                                                                        FFAppState().isWildberriesSelected = true;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        FFAppState().isWildberriesSelected = false;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    side: BorderSide(
                                                                                      width: 2,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Wildberries',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: const CheckboxThemeData(
                                                                                      visualDensity: VisualDensity.compact,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      shape: CircleBorder(),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxValue4 ??= true,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.checkboxValue4 = newValue!);
                                                                                      if (newValue!) {
                                                                                        FFAppState().isYandexSelected = true;
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        FFAppState().isYandexSelected = false;
                                                                                        safeSetState(() {});
                                                                                      }
                                                                                    },
                                                                                    side: BorderSide(
                                                                                      width: 2,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Яндекс Маркет',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (FFAppState()
                                                                    .isSortTrue ==
                                                                true)
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    ListView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if (FFAppState().isPopular == false) {
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      FFAppState().isPopular = true;
                                                                                      safeSetState(() {});
                                                                                      FFAppState().isExpensive = false;
                                                                                      FFAppState().isCheaper = false;
                                                                                      FFAppState().isNovelty = false;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/RadioBtn.png',
                                                                                        width: 20.0,
                                                                                        height: 20.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      FFAppState().isPopular = false;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/RadioBtnFull.png',
                                                                                        width: 20.0,
                                                                                        height: 20.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Популярное',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  if (FFAppState().isExpensive == false) {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().isExpensive = true;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().isCheaper = false;
                                                                                        FFAppState().isNovelty = false;
                                                                                        FFAppState().isPopular = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/RadioBtn.png',
                                                                                          width: 20.0,
                                                                                          height: 20.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().isExpensive = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/RadioBtnFull.png',
                                                                                          width: 20.0,
                                                                                          height: 20.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Дороже',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  if (FFAppState().isCheaper == false) {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().isCheaper = true;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().isExpensive = false;
                                                                                        FFAppState().isNovelty = false;
                                                                                        FFAppState().isPopular = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/RadioBtn.png',
                                                                                          width: 20.0,
                                                                                          height: 20.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().isCheaper = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/RadioBtnFull.png',
                                                                                          width: 20.0,
                                                                                          height: 20.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Дешевле',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  if (FFAppState().isNovelty == false) {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().isNovelty = true;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().isExpensive = false;
                                                                                        FFAppState().isCheaper = false;
                                                                                        FFAppState().isPopular = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/RadioBtn.png',
                                                                                          width: 20.0,
                                                                                          height: 20.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().isNovelty = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/RadioBtnFull.png',
                                                                                          width: 20.0,
                                                                                          height: 20.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Новинка',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (FFAppState().isPopular == true)
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final gridItems = mainpageItemsRecordList
                                            .map((e) => e)
                                            .toList()
                                            .where((e) =>
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty
                                                        ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) ==
                                                            false)
                                                        : true) &&
                                                    (e.linkOzon != '') &&
                                                    (FFAppState().isOzonSelected ==
                                                        true) &&
                                                    (e.price <=
                                                        FFAppState()
                                                            .selectedPriceMax) &&
                                                    (e.price >=
                                                        FFAppState()
                                                            .selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true
                                                        ? (FFAppState().isItemLiked.contains(e.reference) ==
                                                            true)
                                                        : true)) ||
                                                ((FFAppState().searchCatalog != ''
                                                        ? (e.title == FFAppState().searchCatalog)
                                                        : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) &&
                                                    (e.linkWildberries != '') &&
                                                    (FFAppState().isWildberriesSelected == true) &&
                                                    (e.price <= FFAppState().selectedPriceMax) &&
                                                    (e.price >= FFAppState().selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)) ||
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) && (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) && (e.linkMegamarket != '') && (FFAppState().isYandexSelected == true) && (e.price <= FFAppState().selectedPriceMax) && (e.price >= FFAppState().selectedPriceMin) && (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)))
                                            .toList()
                                            .sortedList(keyOf: (e) => e.isPopularEq1, desc: true)
                                            .toList();

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            childAspectRatio: 0.65,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: gridItems.length,
                                          itemBuilder:
                                              (context, gridItemsIndex) {
                                            final gridItemsItem =
                                                gridItems[gridItemsIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          ItemsRecord>(
                                                        stream: ItemsRecord
                                                            .getDocument(
                                                                gridItemsItem
                                                                    .reference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final stackItemsRecord =
                                                              snapshot.data!;

                                                          return Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  stackItemsRecord
                                                                      .imageTitle,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            11.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            functions.isItemNew(gridItemsItem.dateCreate!) ==
                                                                                true,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              4.0,
                                                                              6.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            'НОВИНКА',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppState().isItemLiked.contains(gridItemsItem.reference) ==
                                                                            true) {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().removeFromIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_sharp,
                                                                              color: Color(0xFFF1F200),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().addToIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_border,
                                                                              color: Color(0xFF959598),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        gridItemsItem.title,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Подробнее',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              Container(
                                child: Visibility(
                                  visible: FFAppState().isExpensive == true,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final gridItems = mainpageItemsRecordList
                                            .map((e) => e)
                                            .toList()
                                            .where((e) =>
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty
                                                        ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) ==
                                                            false)
                                                        : true) &&
                                                    (e.linkOzon != '') &&
                                                    (FFAppState().isOzonSelected ==
                                                        true) &&
                                                    (e.price <=
                                                        FFAppState()
                                                            .selectedPriceMax) &&
                                                    (e.price >=
                                                        FFAppState()
                                                            .selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true
                                                        ? (FFAppState().isItemLiked.contains(e.reference) ==
                                                            true)
                                                        : true)) ||
                                                ((FFAppState().searchCatalog != ''
                                                        ? (e.title == FFAppState().searchCatalog)
                                                        : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) &&
                                                    (e.linkWildberries != '') &&
                                                    (FFAppState().isWildberriesSelected == true) &&
                                                    (e.price <= FFAppState().selectedPriceMax) &&
                                                    (e.price >= FFAppState().selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)) ||
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) && (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) && (e.linkMegamarket != '') && (FFAppState().isYandexSelected == true) && (e.price <= FFAppState().selectedPriceMax) && (e.price >= FFAppState().selectedPriceMin) && (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)))
                                            .toList()
                                            .sortedList(keyOf: (e) => e.price, desc: true)
                                            .toList();

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            childAspectRatio: 0.65,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: gridItems.length,
                                          itemBuilder:
                                              (context, gridItemsIndex) {
                                            final gridItemsItem =
                                                gridItems[gridItemsIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          ItemsRecord>(
                                                        stream: ItemsRecord
                                                            .getDocument(
                                                                gridItemsItem
                                                                    .reference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final stackItemsRecord =
                                                              snapshot.data!;

                                                          return Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  stackItemsRecord
                                                                      .imageTitle,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            11.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            functions.isItemNew(gridItemsItem.dateCreate!) ==
                                                                                true,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              4.0,
                                                                              6.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            'НОВИНКА',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppState().isItemLiked.contains(gridItemsItem.reference) ==
                                                                            true) {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().removeFromIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_sharp,
                                                                              color: Color(0xFFF1F200),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().addToIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_border,
                                                                              color: Color(0xFF959598),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        gridItemsItem.title,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Подробнее',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Visibility(
                                  visible: FFAppState().isCheaper == true,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final gridItems = mainpageItemsRecordList
                                            .map((e) => e)
                                            .toList()
                                            .where((e) =>
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty
                                                        ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) ==
                                                            false)
                                                        : true) &&
                                                    (e.linkOzon != '') &&
                                                    (FFAppState().isOzonSelected ==
                                                        true) &&
                                                    (e.price <=
                                                        FFAppState()
                                                            .selectedPriceMax) &&
                                                    (e.price >=
                                                        FFAppState()
                                                            .selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true
                                                        ? (FFAppState().isItemLiked.contains(e.reference) ==
                                                            true)
                                                        : true)) ||
                                                ((FFAppState().searchCatalog != ''
                                                        ? (e.title == FFAppState().searchCatalog)
                                                        : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) &&
                                                    (e.linkWildberries != '') &&
                                                    (FFAppState().isWildberriesSelected == true) &&
                                                    (e.price <= FFAppState().selectedPriceMax) &&
                                                    (e.price >= FFAppState().selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)) ||
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) && (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) && (e.linkMegamarket != '') && (FFAppState().isYandexSelected == true) && (e.price <= FFAppState().selectedPriceMax) && (e.price >= FFAppState().selectedPriceMin) && (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)))
                                            .toList()
                                            .sortedList(keyOf: (e) => e.price, desc: false)
                                            .toList();

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            childAspectRatio: 0.65,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: gridItems.length,
                                          itemBuilder:
                                              (context, gridItemsIndex) {
                                            final gridItemsItem =
                                                gridItems[gridItemsIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          ItemsRecord>(
                                                        stream: ItemsRecord
                                                            .getDocument(
                                                                gridItemsItem
                                                                    .reference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final stackItemsRecord =
                                                              snapshot.data!;

                                                          return Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  stackItemsRecord
                                                                      .imageTitle,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            11.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            functions.isItemNew(gridItemsItem.dateCreate!) ==
                                                                                true,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              4.0,
                                                                              6.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            'НОВИНКА',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppState().isItemLiked.contains(gridItemsItem.reference) ==
                                                                            true) {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().removeFromIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_sharp,
                                                                              color: Color(0xFFF1F200),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().addToIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_border,
                                                                              color: Color(0xFF959598),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        gridItemsItem.title,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Подробнее',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Visibility(
                                  visible: FFAppState().isNovelty == true,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final gridItems = mainpageItemsRecordList
                                            .map((e) => e)
                                            .toList()
                                            .where((e) =>
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty
                                                        ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) ==
                                                            false)
                                                        : true) &&
                                                    (e.linkOzon != '') &&
                                                    (FFAppState().isOzonSelected ==
                                                        true) &&
                                                    (e.price <=
                                                        FFAppState()
                                                            .selectedPriceMax) &&
                                                    (e.price >=
                                                        FFAppState()
                                                            .selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true
                                                        ? (FFAppState().isItemLiked.contains(e.reference) ==
                                                            true)
                                                        : true)) ||
                                                ((FFAppState().searchCatalog != ''
                                                        ? (e.title == FFAppState().searchCatalog)
                                                        : true) &&
                                                    (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) &&
                                                    (e.linkWildberries != '') &&
                                                    (FFAppState().isWildberriesSelected == true) &&
                                                    (e.price <= FFAppState().selectedPriceMax) &&
                                                    (e.price >= FFAppState().selectedPriceMin) &&
                                                    (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)) ||
                                                ((FFAppState().searchCatalog != '' ? (e.title == FFAppState().searchCatalog) : true) && (FFAppState().selectedCatsRef.isNotEmpty ? (functions.isItemInSelCats(e.categoryRef!, FFAppState().selectedCatsRef.toList()) == false) : true) && (e.linkMegamarket != '') && (FFAppState().isYandexSelected == true) && (e.price <= FFAppState().selectedPriceMax) && (e.price >= FFAppState().selectedPriceMin) && (FFAppState().isLikedShown == true ? (FFAppState().isItemLiked.contains(e.reference) == true) : true)))
                                            .toList()
                                            .sortedList(keyOf: (e) => e.dateCreate!, desc: true)
                                            .toList();

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            childAspectRatio: 0.65,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: gridItems.length,
                                          itemBuilder:
                                              (context, gridItemsIndex) {
                                            final gridItemsItem =
                                                gridItems[gridItemsIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          ItemsRecord>(
                                                        stream: ItemsRecord
                                                            .getDocument(
                                                                gridItemsItem
                                                                    .reference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final stackItemsRecord =
                                                              snapshot.data!;

                                                          return Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  stackItemsRecord
                                                                      .imageTitle,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            11.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            functions.isItemNew(gridItemsItem.dateCreate!) ==
                                                                                true,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              4.0,
                                                                              6.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            'НОВИНКА',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppState().isItemLiked.contains(gridItemsItem.reference) ==
                                                                            true) {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().removeFromIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_sharp,
                                                                              color: Color(0xFFF1F200),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().addToIsItemLiked(gridItemsItem.reference);
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Icons.favorite_border,
                                                                              color: Color(0xFF959598),
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        gridItemsItem.title,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Подробнее',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
