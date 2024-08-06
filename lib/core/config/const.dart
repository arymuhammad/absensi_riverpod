import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var blue = Colors.blue;
var bluelight = Colors.blue[50];
var red = Colors.red;
var green = Colors.green;
var blueAccent = Colors.blueAccent[700];
var greenAccent = Colors.greenAccent[700];
var redAccent = Colors.redAccent[700];
var white = Colors.white;
var black = Colors.black;
var grey = Colors.grey;
var greylight = Colors.grey[100];

var dateNow = DateTime.now();
var initDate1 = DateFormat('yyyy-MM-dd')
    .format(DateTime.parse(
        DateTime(DateTime.now().year, DateTime.now().month, 1).toString()))
    .toString();
var initDate2 = DateFormat('yyyy-MM-dd')
    .format(DateTime.parse(
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0).toString()))
    .toString();

class FormatWaktu {
  static formatBulan({required String tanggal}) {
    return DateFormat('MMM')
        .format(DateTime.parse(tanggal))
        .toUpperCase()
        .toString();
  }

  static formatTanggal({required String tanggal}) {
    return DateFormat('dd').format(DateTime.parse(tanggal)).toString();
  }

  static formatHari({required String tanggal}) {
    return DateFormat("EEEE", "id_ID")
        .format(DateTime.parse(tanggal))
        .toString();
  }

  static formatJamMenit({required String jamMasuk}) {
    return DateFormat("HH:mm").parse(jamMasuk);
  }

  static formatIndo({required DateTime tanggal}) {
    return DateFormat("EEEE, d MMMM yyyy", "id_ID").format(tanggal).toString();
  }
}
