import 'dart:io';

import 'package:absensi_riverpod/src/global/controller/init_controller.dart';
import 'package:absensi_riverpod/src/global/controller/shared_prefs_controller.dart';
import 'package:absensi_riverpod/src/model/user.dart';
import 'package:absensi_riverpod/src/routes/app_pages.dart';
import 'package:absensi_riverpod/src/shared/flutter_toast.dart';
import 'package:absensi_riverpod/src/shared/loading_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/config/messages.dart';
import '../../../model/login_model.dart';
import '../../../shared/snackbar_service.dart';
import '../repository/login_repository.dart';

class LoginAuthController {
  Ref ref;
  final LoginAuth _auth;
  LoginAuthController({required LoginAuth auth, required this.ref})
      : _auth = auth;
  Future<Login?> login(
      {BuildContext? context, Map<String, dynamic>? data}) async {
    CsLoading.showLoading(context: context!);
    final result = await _auth.login(data);
    return result.fold((failure) {
      if (Platform.isAndroid) {
        showToast(FailureMessage.authFetched);
      } else {
        if (!AppConfig.devMode) {
          SnackBarService.showSnackBar(
              context: context, message: FailureMessage.authFetched);
        }
      }
      Navigator.pop(context);
      return null;
    }, (success) {
      if (success.data != null) {
        ref.read(sharedPrefsControllerPovider).setUser(
            user: Data(
                id: success.data!.id,
                kodeCabang: success.data!.kodeCabang,
                namaCabang: success.data!.namaCabang,
                nama: success.data!.nama,
                username: success.data!.username,
                password: success.data!.password,
                levelUser: success.data!.levelUser,
                level: success.data!.level,
                foto: success.data!.foto,
                noTelp: success.data!.noTelp,
                lat: success.data!.lat,
                long: success.data!.long,
                areaCover: success.data!.areaCover,
                cekStok: success.data!.cekStok,
                visit: success.data!.visit));

        ref.read(loggedInProvider.notifier).state = true;
        ref.read(initControllerProvider).initUserAndToken();

        if (Platform.isAndroid) {
          showToast(SuccessMessage.authFetched);
        } else {
          if (!AppConfig.devMode) {
            SnackBarService.showSnackBar(
                context: context, message: SuccessMessage.authFetched);
          }
        }
      }
       else {
        if (Platform.isAndroid) {
          showToast(FailureMessage.authFetched);
        } else {
          if (!AppConfig.devMode) {
            SnackBarService.showSnackBar(
                context: context, message: FailureMessage.authFetched);
          }
        }
      }
      Navigator.pop(context);
      return success;
    });
  }
}

final loginAuthController = Provider((ref) {
  final auth = ref.watch(loginAuthProvider);
  return LoginAuthController(auth: auth, ref: ref);
});
