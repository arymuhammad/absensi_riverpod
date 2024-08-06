import 'dart:io';

import 'package:absensi_riverpod/src/features/home/view/summary_section.dart';
import 'package:absensi_riverpod/src/shared/flutter_toast.dart';
import 'package:absensi_riverpod/src/shared/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/config/const.dart';
import '../../../global/providers/common_providers.dart';
import '../provider/home_provider.dart';

class DateTimeSection extends ConsumerWidget {
  DateTimeSection({super.key});
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropMaterialHeader(
          backgroundColor: blue,
        ),
        onRefresh: () async {
          
          await Future.delayed(const Duration(seconds: 1), () async {
            // await home.getAttData(context: context, data: {
            //   "mode": "limit",
            //   "id_user": userData!.id!,
            //   "tanggal1": "2024-05-01",
            //   "tanggal2": initDate2
            // });
            ref.invalidate(homeProvider);
            // var paramLimitVisit = {
            //   "mode": "limit",
            //   "id_user": userData![0],
            //   "tanggal1": absenC.initDate1,
            //   "tanggal2": absenC.initDate2
            // };

            // var paramSingleVisit = {
            //   "mode": "single",
            //   "id_user": userData![0],
            //   "tgl_visit": absenC.dateNow
            // };
            // absenC.isLoading.value = true;
            // await absenC.getVisitToday(paramSingleVisit);
            // await absenC.getLimitVisit(paramLimitVisit);

            _refreshController.refreshCompleted();
            showToast("Halaman Disegarkan.");
          });
        },
        child: ListView(
          padding: const EdgeInsets.only(top: 20),
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Bootstrap.calendar3,
                              size: 17,
                              color: blue,
                            ),
                            const SizedBox(width: 5),
                            Text(FormatWaktu.formatIndo(tanggal: dateNow),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesome.map_location_dot_solid,
                              size: 17,
                              color: blue,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '-',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(Bootstrap.clock, size: 20),
                          const SizedBox(
                            height: 10,
                          ),
                          // Obx(
                          //   () => absenC.isLoading.value
                          // ?
                          // Platform.isAndroid
                          //     ? const SizedBox(height: 17, width: 17, child:  CircularProgressIndicator())
                          //     : const SizedBox(height: 17, width: 17, child:   CupertinoActivityIndicator())
                          // :
                          const Text(
                            '-:-',
                            // style: TextStyle(
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.bold,
                            //     color: absenC.dataVisit.isNotEmpty &&
                            //             absenC.dataVisit[0].jamIn! != ""
                            //         ? timeColor
                            //         : defaultColor),
                            // ),
                          ),
                          Text(
                            'Masuk',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Transform.flip(
                              flipX: true,
                              flipY: true,
                              child: const Icon(Bootstrap.clock, size: 20)),
                          const SizedBox(
                            height: 10,
                          ),
                          // Obx(
                          //   () => absenC.isLoading.value
                          //      ? Platform.isAndroid
                          //           ? const SizedBox(height: 17, width: 17, child:  CircularProgressIndicator())
                          //           : const SizedBox(height: 17, width: 17, child:   CupertinoActivityIndicator())
                          //       :
                          const Text(
                            '-:-',
                            // style: TextStyle(
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.bold,
                            // color: absenC.dataVisit.isNotEmpty &&
                            //         absenC.dataVisit[0].jamOut! != ""
                            //     ? timeColor
                            //     : defaultColor),
                            // ),
                          ),
                          Text(
                            'Keluar',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Bootstrap.clock_history, size: 20),
                          const SizedBox(
                            height: 10,
                          ),
                          // Obx(
                          //   () {
                          //     var diffHours = const Duration();
                          //     if (absenC.dataVisit.isNotEmpty &&
                          //         absenC.dataVisit[0].jamOut != "") {
                          //       diffHours = DateTime.parse(
                          //               '${absenC.dataVisit[0].tglVisit!} ${absenC.dataVisit[0].jamOut!}')
                          //           .difference(DateTime.parse(
                          //               '${absenC.dataVisit[0].tglVisit!} ${absenC.dataVisit[0].jamIn!}'));
                          //     } else {
                          //       diffHours = const Duration();
                          //     }
                          //     return absenC.isLoading.value
                          //      ? Platform.isAndroid
                          //           ? const SizedBox(height: 17, width: 17, child:  CircularProgressIndicator())
                          //           : const SizedBox(height: 17, width: 17, child:   CupertinoActivityIndicator())
                          //       : Text(
                          //       absenC.dataVisit.isNotEmpty &&
                          //               absenC.dataVisit[0].jamIn! != ""
                          //           ? '${absenC.dataVisit[0].jamOut != "" ? diffHours.inHours : '0'}j ${absenC.dataVisit[0].jamOut != "" ? diffHours.inMinutes % 60 : '0'}m'
                          //           : '-:-',
                          //       style: TextStyle(
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.bold,
                          //           color: absenC.dataVisit.isNotEmpty &&
                          //                 absenC.dataVisit[0].jamIn! != ""
                          //             ? timeColor
                          //             : defaultColor),
                          //     );
                          //   },
                          // ),
                          Text(
                            'Durasi Kerja',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Colors.white,
              thickness: 2,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Riwayat absensi minggu ini',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const SummarySection()
          ],
        ),
      ),
    );
  }
}
