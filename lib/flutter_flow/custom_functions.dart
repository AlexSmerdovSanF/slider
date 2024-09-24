import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int randomDigits() {
  // make random number with 6 digits
  return math.Random().nextInt(900000) + 100000;
}

bool? searchInList(
  String searchMain,
  String titleResume,
) {
  if (searchMain.isEmpty) {
    return false;
  }
  // функция, у которой на входе две переменных - searchMain и  titleResume, обе string. Функция приводит обе переменные к нижнему регистру и проверяет, содержится ли в titleResume searchMain. Если содержится, то true, иначе false
  searchMain = searchMain.toLowerCase();
  titleResume = titleResume.toLowerCase();
  return titleResume.contains(searchMain);
}

bool? isItemInSelCats(
  DocumentReference categoryRef,
  List<DocumentReference> selectedCatsRef,
) {
  // write a function that has an input appstate "selectedCatsRef" of type List<DocReference> and a "categoryRef" of type DocReference (category). The function returns true if the selectedCatsRef contains categoryRef, otherwise it returns false
  return selectedCatsRef.contains(categoryRef);
}

bool? isItemNew(DateTime dateCreate) {
  // функция на входе имеет dateCreate типа datetime, если разность между текущим временем и dateCreate менее двух месяцев, то возвращает true, иначе false
  final now = DateTime.now();
  final difference = now.difference(dateCreate);
  return difference.inDays < 60;
}

int? countUnreaded(List<DocumentReference>? messages) {
  // on the input of the appstate "unreadedMessage" (documentreference, message, list), the function determines the number of items in the list ...
  if (messages == null) {
    return null;
  }
  int count = 0;
  for (DocumentReference message in messages) {
    if (message != null) {
      count++;
    }
  }
  return count;
}

String? gerRandomCode() {
  return math.Random().nextInt(10000).toString().padLeft(4, '0');
}
