import 'package:absensi_riverpod/src/routes/app_pages.dart';
import 'package:absensi_riverpod/src/shared/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/config/messages.dart';
import '../../../model/login_model.dart';
import '../../../shared/snackbar_service.dart';
import '../repository/login_repository.dart';

class LoginAuthController {
  final LoginAuth _auth;
  LoginAuthController({required LoginAuth auth}) : _auth = auth;

  Future<Login?> login(
      {BuildContext? context, String? username, String? password}) async {
    final result = await _auth.login(username, password);
    return result.fold((failure) {
      if (AppConfig.devMode && context != null) {
        SnackBarService.showSnackBar(
            context: context, message: FailureMessage.authFetched);
      }
      return null;
    }, (success) {
      if (AppConfig.devMode && context != null) {
        SnackBarService.showSnackBar(
            context: context, message: SuccessMessage.authFetched);
      }
      return success;
    });
  }
}

final loginAuthController = Provider((ref) {
  final auth = ref.watch(loginAuthProvider);
  return LoginAuthController(auth: auth);
});
