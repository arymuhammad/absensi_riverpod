import 'dart:convert';
import 'dart:developer';

import 'package:absensi_riverpod/core/config/core.dart';
import 'package:absensi_riverpod/core/config/endpoints.dart';
import 'package:absensi_riverpod/src/model/absen_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/messages.dart';
import '../../../../core/config/network.dart';

class HistoryRepo {
  final NetworkRepo _api;
  final name = "History Presence";
  HistoryRepo({required NetworkRepo api}) : _api = api;

  FutureEither<List<Absen>> getAllPresence(Map<String, dynamic>? data) async {
    final result = await _api.postRequest(
        url: EndPoints.getAbsenData, body: data, requireAuth: false);
    return result.fold((Failure failure) {
      log(failure.message, name: name);
      return Left(failure);
    }, (response) {
      try {
        final data = jsonDecode(response.body);
        final historydata = data["data"];
        List<Absen> resltData = [];
        // log(productJson.toString(), name: name);
        // Login loginData;
        for (dynamic presence in historydata) {
          // log(data.toString(), name: name);
          resltData.add(Absen.fromJson(presence));
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

final historyRepoProvider = Provider((ref) {
  final api = ref.watch(networkRepoProvider);
  return HistoryRepo(api: api);
});
