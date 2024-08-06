import 'dart:developer';

import 'package:absensi_riverpod/src/model/absen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/config/core.dart';
import '../../../../core/config/messages.dart';
import '../../../shared/snackbar_service.dart';
import '../repository/home_repository.dart';

class HomeProvider {
  final HomeRepo _api;
  HomeProvider({required HomeRepo api}) : _api = api;

  Future<List<Absen>> getAttData(
      {BuildContext? context, Map<String, dynamic>? data}) async {
    final result = await _api.getAttData(data);
    return result.fold((failure) {
      if (AppConfig.devMode && context != null) {
        SnackBarService.showSnackBar(
            context: context, message: FailureMessage.attendanceFetched);
      }

      return [];
    }, (data) {
      if (AppConfig.devMode && context != null) {
        SnackBarService.showSnackBar(
            context: context, message: SuccessMessage.attendanceFetched);
      }

      return data;
    });
  }
}

final homeProvider = Provider(
    (ref) {
  // final abs =  await ref.watch(homeRepoProvider).getAttData(data);
  // return abs.fold((failure) {
  //   return [];
  // }, (data) {
  //   return data;
  // });
// final homeProvider = FutureProvider.family<List<Absen>, Map<String, dynamic>>(
//     (ref, data)  async{
//   final abs =  await ref.watch(homeRepoProvider).getAttData(data);
//   return abs.fold((failure) {
//     return [];
//   }, (data) {
//     return data;
//   });
  final api = ref.watch(homeRepoProvider);
  return HomeProvider(api: api);
});
