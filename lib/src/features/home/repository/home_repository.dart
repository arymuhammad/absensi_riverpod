import 'dart:convert';
import 'dart:developer';

import 'package:absensi_riverpod/core/config/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import '../../../../core/config/endpoints.dart';
import '../../../../core/config/messages.dart';
import '../../../model/absen_model.dart';

class HomeRepo {
  final NetworkRepo _api;
  final String name = "Attendance History (Limited 7 days)";
  HomeRepo({required NetworkRepo api}) : _api = api;

  FutureEither<List<Absen>> getAttData(Map<String, dynamic>? data) async {
    final result = await _api.postRequest(
        url: EndPoints.getAbsenData, body: data, requireAuth: false);
    return result.fold((Failure failure) {
      log(failure.message, name: name);
      return Left(failure);
    }, (Response response) {
      try {
        final data = jsonDecode(response.body);
        final historydata = data["data"];
        List<Absen> resltData = [];
        // log(productJson.toString(), name: name);
        // Login loginData;
        for (dynamic listAtt in historydata) {
          // log(data.toString(), name: name);
          resltData.add(Absen.fromJson(listAtt));
        }
        return Right(resltData);
      } catch (e, stktrc) {
        log(FailureMessage.jsonParsingFailed, name: name);
        return Left(Failure(
          message: FailureMessage.jsonParsingFailed,
          stackTrace: stktrc,
        ));
      }
    });
  }

}

final homeRepoProvider = Provider((ref) {
  final api = ref.read(networkRepoProvider);
  return HomeRepo(api: api);
});
