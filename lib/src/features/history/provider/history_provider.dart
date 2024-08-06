import 'package:absensi_riverpod/core/config/app_config.dart';
import 'package:absensi_riverpod/core/config/const.dart';
import 'package:absensi_riverpod/src/model/absen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/messages.dart';
import '../../../shared/snackbar_service.dart';
import '../repository/history_repository.dart';

class HistoryProvider {
  final HistoryRepo _repo;
  HistoryProvider({required HistoryRepo repo}) : _repo = repo;
  var isLoading = true;

  Future<List<Absen>?> getAllPresence(
      {BuildContext? context, Map<String, dynamic>? data}) async {
    final result = await _repo.getAllPresence(data);
    isLoading;
    return result.fold((failure) {
      if (AppConfig.devMode && context != null) {
        SnackBarService.showSnackBar(
            context: context, message: FailureMessage.historyFetched);
      }
      isLoading = false;
      return null;
    }, (success) {
      if (AppConfig.devMode && context != null) {
        SnackBarService.showSnackBar(
            context: context, message: SuccessMessage.historyFetched);
      }
      isLoading = false;
      return success;
    });
  }
}

final historyProvider = Provider((ref) {
  final repo = ref.watch(historyRepoProvider);
  return HistoryProvider(repo: repo);
});
