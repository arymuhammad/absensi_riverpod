import 'dart:convert';
import 'dart:developer';
import 'dart:math' as rnd;
import 'package:absensi_riverpod/src/model/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/app_config.dart';
import '../../model/user.dart';

final sharedPrefsRepoProvider =
    Provider<SharedPrefsRepo>((ref) => SharedPrefsRepo());

class SharedPrefsRepo {
  final String _tokenKey = "COOKIE_TOKEN";
  final String _currentUserKey = "CURRENT_USER";
  final String _isAuth = "IS_AUTH";
  final _name = "SHARED_PREFS_REPO";
  final String characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+';
  var username = "";
  var password = "";

  rnd.Random random = rnd.Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));

  Future<String?> getCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString(_tokenKey);
    if (!AppConfig.devMode) {
      log("Reading cookie", name: _name);
      log("Data : $cookie", name: _name);
    }
    return cookie;
  }

  Future<Data?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_currentUserKey);
    if (!AppConfig.devMode) {
      log("Reading user", name: _name);
      log("Data : $data", name: _name);
    }
    final user = data != null ? Data.fromJson(jsonDecode(data)) : null;
    return user;
  }

  Future<void> setCurrentUser(Data user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (AppConfig.devMode) {
      log("Saving user", name: _name);
      log("Data : ${user.toJson()}", name: _name);
    }
    prefs.setString(_currentUserKey, jsonEncode(user.toJson()));
  }

  Future<void> isAuth({bool status = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (AppConfig.devMode) {
      log("Saving auth", name: _isAuth);
      log("Data : $status", name: _isAuth);
    }
    prefs.setBool(_isAuth, status);
  }

  Future<bool?> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getBool(_isAuth);
    if (!AppConfig.devMode) {
      log("Reading auth", name: _isAuth);
      log("Data : $data", name: _isAuth);
    }
    // final user = data != null ? User.fromJson(jsonDecode(data)) : null;
    return data;
  }

  Future<void> setCookie(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (AppConfig.devMode) {
      log("Saving cookie", name: _name);
      log("Data : $cookie", name: _name);
    }
    prefs.setString(_tokenKey, cookie);
  }

  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
