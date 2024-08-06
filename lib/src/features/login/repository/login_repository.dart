import 'dart:convert';
import 'dart:developer';
import 'package:absensi_riverpod/core/config/core.dart';
import 'package:absensi_riverpod/core/config/endpoints.dart';
import 'package:absensi_riverpod/src/model/login_model.dart';
// import 'package:absensi_riverpod/src/shared/flutter_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import '../../../../core/config/messages.dart';

class LoginAuth {
  final NetworkRepo _api;
  final name = "Login auth";
  LoginAuth({required NetworkRepo api}) : _api = api;

  FutureEither<Login> login(Map<String, dynamic>? data) async {
    final result = await _api.postRequest(
        url: EndPoints.login, body: data, requireAuth: false);
    return result.fold(
      (Failure failure) {
        log(failure.message, name: name);
        return Left(failure);
      },
      (Response response) {
        try {
          final data = jsonDecode(response.body);
          final productJson = data;
          log(productJson.toString(), name: name);
          // Login loginData;
          // for (dynamic data in productJson) {
          // log(data.toString(), name: name);
          Login loginData = Login.fromJson(productJson);
          // }

          return Right(loginData);
        } catch (e, stktrc) {
          log(FailureMessage.jsonParsingFailed, name: name);
          return Left(Failure(
            message: FailureMessage.jsonParsingFailed,
            stackTrace: stktrc,
          ));
        }
      },
    );
  }
}

final loginAuthProvider = Provider<LoginAuth>((ref) {
  final api = ref.watch(networkRepoProvider);
  return LoginAuth(api: api);
});
