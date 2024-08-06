import 'dart:math';

import 'package:absensi_riverpod/core/config/const.dart';
import 'package:absensi_riverpod/src/global/providers/common_providers.dart';
import 'package:absensi_riverpod/src/shared/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../provider/home_provider.dart';

class SummarySection extends ConsumerWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider);
    final userData = ref.read(currentUserProvider);
    return FutureBuilder(
      future: home.getAttData(context: context, data: {
        "mode": "limit",
        "id_user": userData!.id!,
        "tanggal1": "2024-05-01",
        "tanggal2": initDate2
      }),
      builder: ((context, snapshot) {
        final data = snapshot.data;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(height: 250, child: CsShimmer());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && data!.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (c, i) {
              // var diffHours = const Duration();
              // if (absenC.dataLimitVisit[i].jamOut != "") {
              //   diffHours = DateTime.parse(
              //           '${absenC.dataLimitVisit[i].tglVisit!} ${absenC.dataLimitVisit[i].jamOut!}')
              //       .difference(DateTime.parse(
              //           '${absenC.dataLimitVisit[i].tglVisit!} ${absenC.dataLimitVisit[i].jamIn!}'));
              // } else {
              //   diffHours = const Duration();
              // }

              return InkWell(
                onTap: () {}
                //   Get.to(() => DetailVisitView(), arguments: {
                // "foto_profil": userData![5] != ""
                //     ? userData![5]
                //     : userData![1],
                // "nama": absenC.dataLimitVisit[i].nama!,
                // "store": absenC.dataLimitVisit[i].namaCabang!,
                // "id_user": absenC.dataLimitVisit[i].id!,
                // "tgl_visit": absenC.dataLimitVisit[i].tglVisit!,
                // "jam_in": absenC.dataLimitVisit[i].jamIn!,
                // "foto_in": absenC.dataLimitVisit[i].fotoIn!,
                // "jam_out": absenC.dataLimitVisit[i].jamOut != ""
                //     ? absenC.dataLimitVisit[i].jamOut!
                //     : "",
                // "foto_out":
                //     absenC.dataLimitVisit[i].fotoOut != ""
                //         ? absenC.dataLimitVisit[i].fotoOut!
                //         : "",
                // "lat_in": absenC.dataLimitVisit[i].latIn!,
                // "long_in": absenC.dataLimitVisit[i].longIn!,
                // "lat_out": absenC.dataLimitVisit[i].latOut != ""
                //     ? absenC.dataLimitVisit[i].latOut!
                //     : "",
                // "long_out":
                //     absenC.dataLimitVisit[i].longOut != ""
                //         ? absenC.dataLimitVisit[i].longOut!
                //         : "",
                // "device_info":
                //     absenC.dataLimitVisit[i].deviceInfo!,
                // "device_info2":
                //     absenC.dataLimitVisit[i].deviceInfo2 != ""
                //         ? absenC.dataLimitVisit[i].deviceInfo2
                //         : ""
                // }
                ,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              FormatWaktu.formatBulan(
                                  tanggal: data[i].tanggalMasuk!),
                              style: TextStyle(color: black),
                            ),
                            Text(
                              FormatWaktu.formatTanggal(
                                  tanggal: data[i].tanggalMasuk!),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                FormatWaktu.formatHari(
                                    tanggal: data[i].tanggalMasuk!),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: black)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              FormatWaktu.formatJamMenit(
                                          jamMasuk: data[i].jamAbsenMasuk!)
                                      .isBefore(FormatWaktu.formatJamMenit(
                                          jamMasuk: data[i].jamMasuk!))
                                  ? "Awal Waktu"
                                  : FormatWaktu.formatJamMenit(
                                              jamMasuk: data[i].jamAbsenMasuk!)
                                          .isAtSameMomentAs(
                                              FormatWaktu.formatJamMenit(
                                                  jamMasuk: data[i].jamMasuk!))
                                      ? "Tepat Waktu"
                                      : "Telat",
                              style: TextStyle(
                                  color: FormatWaktu.formatJamMenit(
                                              jamMasuk: data[i].jamAbsenMasuk!)
                                          .isBefore(FormatWaktu.formatJamMenit(
                                              jamMasuk: data[i].jamMasuk!))
                                      ? greenAccent
                                      : FormatWaktu.formatJamMenit(
                                                  jamMasuk:
                                                      data[i].jamAbsenMasuk!)
                                              .isAtSameMomentAs(
                                                  FormatWaktu.formatJamMenit(
                                                      jamMasuk:
                                                          data[i].jamMasuk!))
                                          ? greenAccent
                                          : redAccent),
                            )
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  const Text('Masuk'),
                                  Text(
                                    data[i].jamAbsenMasuk!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  const Text('Keluar'),
                                  Text(
                                    data[i].jamAbsenPulang != ""
                                        ? data[i].jamAbsenPulang!
                                        : "-",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('No data found'));
        }
      }),
    );
  }
}
