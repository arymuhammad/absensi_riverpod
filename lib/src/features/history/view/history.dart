import 'package:absensi_riverpod/core/config/base_path.dart';
import 'package:absensi_riverpod/src/features/history/provider/history_provider.dart';
import 'package:absensi_riverpod/src/global/providers/common_providers.dart';
import 'package:absensi_riverpod/src/shared/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../../core/config/const.dart';
import '../../../shared/clip_header_background.dart';
import '../../../shared/flutter_toast.dart';

class History extends ConsumerStatefulWidget {
  const History({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.read(currentUserProvider);
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${BasePaths.baseImagePath}/bgapp.jpg'),
                      fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 15.0, right: 15.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 620,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 10.0, right: 15.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 8,
                              child: TextField(
                                // controller: absenC.filterAbsen,
                                // onChanged: (data) => absenC.filterDataAbsen(data),
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: 'format thn-bln-tgl',
                                    labelText: 'Cari Absen',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ),
                          //                  Obx(
                          //   () => absenC.ascending.value
                          //       ? SizedBox(
                          //         width: 45,height: 65,
                          //         child: Card(
                          //           color: blue,
                          //           shape: RoundedRectangleBorder(
                          //                         borderRadius: BorderRadius.circular(10)),
                          //                     elevation: 8,
                          //           child: IconButton(
                          //               tooltip: 'Sort ASC',
                          //               onPressed: () {
                          //                 absenC.searchAbsen.sort(
                          //                     (a, b) => a.tanggalMasuk!.compareTo(b.tanggalMasuk!));
                          //                 absenC.ascending.value = false;
                          //               },
                          //               icon: const Icon(
                          //                 CupertinoIcons.line_horizontal_3_decrease,
                          //                 color: Colors.white,
                          //               )),
                          //         ),
                          //       )
                          //       : SizedBox(width: 45,
                          //       height: 65,
                          //         child: Card(
                          //           color: blue,
                          //           shape: RoundedRectangleBorder(
                          //                         borderRadius: BorderRadius.circular(10)),
                          //                     elevation: 8,
                          //           child: IconButton(
                          //               tooltip: 'Sort DESC',
                          //               onPressed: () {
                          //                 absenC.searchAbsen.sort(
                          //                     (a, b) => b.tanggalMasuk!.compareTo(a.tanggalMasuk!));
                          //                 absenC.ascending.value = true;
                          //               },
                          //               icon: Transform.rotate(
                          //                 angle: 180 * math.pi / 180,
                          //                 child: const Icon(
                          //                   CupertinoIcons.line_horizontal_3_decrease,
                          //                   color: Colors.white,
                          //                 ),
                          //               )),
                          //         ),
                          //       ),
                          // )
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    //   child: Obx(() => Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text('Periode',
                    //               style: TextStyle(color: grey, fontSize: 18)),
                    //           Text(
                    //             absenC.searchDate.value != ""
                    //                 ? absenC.searchDate.value
                    //                 : absenC.thisMonth,
                    //             style: TextStyle(color: blue, fontSize: 18),
                    //           ),
                    //         ],
                    //       )),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: grey,
                        thickness: 1,
                      ),
                    ),
                    Expanded(
                        // child: Obx(
                        //   () {
                        //     return absenC.isLoading.value
                        //         ? const CsShimmer()
                        //         : absenC.searchAbsen.isEmpty
                        //             ? RefreshIndicator(
                        //                 onRefresh: () {
                        //                   return Future.delayed(const Duration(seconds: 1),
                        //                       () async {
                        //                     // await absenC
                        //                     //     .getAllAbsen(data![0]);
                        //                     // absenC.searchDate.value = "";
                        //                     // showToast("Halaman Disegarkan.");
                        //                   });
                        //                 },
                        //     child: ListView(
                        //       physics: const AlwaysScrollableScrollPhysics(),
                        //       children: [
                        //         Padding(
                        //           padding:
                        //               EdgeInsets.only(top: Get.size.height / 3),
                        //           child: const Column(
                        //             children: [
                        //               Center(
                        //                 child: Text('Belum ada data absen'),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   )
                        // :
                        child: RefreshIndicator(
                      onRefresh: () {
                        return Future.delayed(const Duration(seconds: 1),
                            () async {
                          // await absenC
                          //     .getAllAbsen(data![0]);
                          // absenC.searchDate.value = "";
                          showToast("Halaman Disegarkan.");
                        });
                      },
                      child: FutureBuilder(
                        future: ref.watch(historyProvider).getAllPresence(
                            data: {
                              "mode": "",
                              "id_user": userId!.id,
                              "tanggal1": "2024-05-01",
                              "tanggal2": initDate2
                            }),
                        builder: (context, snapshot) {
                          final data = snapshot.data;

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(
                              height: 250,
                              child: CsShimmer(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData && data!.isNotEmpty) {
                            ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 20.0, right: 20.0),
                              itemCount: data.length,
                              itemBuilder: (c, i) {
                                return InkWell(
                                  // onTap: () {
                                  //   absenC.searchAbsen;
                                  //   Get.toNamed(Routes.DETAIL_ABSEN,
                                  //       arguments: {
                                  //         "foto_profil":
                                  //             data![5] != "" ? data![5] : data![1],
                                  //         "nama": absenC.searchAbsen[i].nama!,
                                  //         "nama_shift":
                                  //             absenC.searchAbsen[i].namaShift!,
                                  //         "id_user":
                                  //             absenC.searchAbsen[i].idUser!,
                                  //         "tanggal_masuk": absenC
                                  //             .searchAbsen[i].tanggalMasuk!,
                                  //         "tanggal_pulang": absenC
                                  //                     .searchAbsen[i]
                                  //                     .tanggalPulang !=
                                  //                 null
                                  //             ? absenC
                                  //                 .searchAbsen[i].tanggalPulang!
                                  //             : "",
                                  //         "jam_masuk": DateFormat("HH:mm")
                                  //                 .parse(absenC.searchAbsen[i]
                                  //                     .jamAbsenMasuk!)
                                  //                 .isBefore(DateFormat("HH:mm")
                                  //                     .parse(absenC
                                  //                         .searchAbsen[i]
                                  //                         .jamMasuk!))
                                  //             ? "Awal Waktu"
                                  //             : DateFormat("HH:mm")
                                  //                     .parse(absenC
                                  //                         .searchAbsen[i]
                                  //                         .jamAbsenMasuk!)
                                  //                     .isAtSameMomentAs(
                                  //                         DateFormat("HH:mm")
                                  //                             .parse(absenC
                                  //                                 .searchAbsen[i]
                                  //                                 .jamMasuk!))
                                  //                 ? "Tepat Waktu"
                                  //                 : "Telat",
                                  //         "jam_pulang": absenC.searchAbsen[i]
                                  //                     .jamAbsenPulang! ==
                                  //                 ""
                                  //             ? "Belum Absen"
                                  //             : DateTime.parse(absenC.searchAbsen[i].tanggalPulang!)
                                  //                         .isAfter(DateTime.parse(absenC
                                  //                             .searchAbsen[i]
                                  //                             .tanggalMasuk!)) &&
                                  //                     DateFormat("HH:mm")
                                  //                         .parse(absenC
                                  //                             .searchAbsen[i]
                                  //                             .jamAbsenPulang!)
                                  //                         .isBefore(DateFormat("HH:mm")
                                  //                             .parse("08:01"))
                                  //                 ? "Lembur"
                                  //                 : DateFormat("HH:mm")
                                  //                         .parse(absenC.searchAbsen[i].jamAbsenPulang!)
                                  //                         .isBefore(DateFormat("HH:mm").parse(absenC.searchAbsen[i].jamPulang!))
                                  //                     ? "Pulang Cepat"
                                  //                     : "Lembur",
                                  //         "jam_absen_masuk": absenC
                                  //             .searchAbsen[i].jamAbsenMasuk!,
                                  //         "jam_absen_pulang": absenC
                                  //             .searchAbsen[i].jamAbsenPulang!,
                                  //         "foto_masuk":
                                  //             absenC.searchAbsen[i].fotoMasuk!,
                                  //         "foto_pulang":
                                  //             absenC.searchAbsen[i].fotoPulang!,
                                  //         "lat_masuk":
                                  //             absenC.searchAbsen[i].latMasuk!,
                                  //         "long_masuk":
                                  //             absenC.searchAbsen[i].longMasuk!,
                                  //         "lat_pulang":
                                  //             absenC.searchAbsen[i].latPulang!,
                                  //         "long_pulang":
                                  //             absenC.searchAbsen[i].longPulang!,
                                  //         "device_info":
                                  //             absenC.searchAbsen[i].devInfo!,
                                  //         "device_info2":
                                  //             absenC.searchAbsen[i].devInfo2!,
                                  //       });
                                  //   absenC.filterAbsen.clear();
                                  //   absenC.filterDataAbsen("");
                                  // },
                                  child: Card(
                                    color: white,
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 10,
                                            // height:
                                            //     Get.mediaQuery.size.height / 12,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: FormatWaktu.formatJamMenit(
                                                            jamMasuk: data[i]
                                                                .jamAbsenMasuk!)
                                                        .isBefore(FormatWaktu.formatJamMenit(
                                                            jamMasuk: data[i]
                                                                .jamAbsenMasuk!))
                                                    ? Colors.greenAccent[700]
                                                    : FormatWaktu.formatJamMenit(
                                                                jamMasuk: data[i]
                                                                    .jamAbsenMasuk!)
                                                            .isAtSameMomentAs(
                                                                FormatWaktu.formatJamMenit(
                                                                    jamMasuk:
                                                                        data[i].jamAbsenMasuk!))
                                                        ? Colors.greenAccent[700]
                                                        : Colors.redAccent[700],
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                ))),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              FormatWaktu.formatBulan(
                                                      tanggal:
                                                          data[i].tanggalMasuk!)
                                                  .toUpperCase(),
                                              style: TextStyle(color: grey),
                                            ),
                                            Text(
                                              FormatWaktu.formatHari(
                                                  tanggal:
                                                      data[i].tanggalMasuk!),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                FormatWaktu.formatHari(
                                                    tanggal:
                                                        data[i].tanggalMasuk!),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: black)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                             FormatWaktu.formatJamMenit(
                                                            jamMasuk: data[i]
                                                                .jamAbsenMasuk!)
                                                        .isBefore(FormatWaktu.formatJamMenit(
                                                            jamMasuk: data[i]
                                                                .jamAbsenMasuk!))
                                                  ? "Awal Waktu"
                                                  : FormatWaktu.formatJamMenit(
                                                                jamMasuk: data[i]
                                                                    .jamAbsenMasuk!)
                                                            .isAtSameMomentAs(
                                                                FormatWaktu.formatJamMenit(
                                                                    jamMasuk:
                                                                        data[i].jamAbsenMasuk!))
                                                      ? "Tepat Waktu"
                                                      : "Telat",
                                              style: TextStyle(
                                                  color: FormatWaktu.formatJamMenit(
                                                            jamMasuk: data[i]
                                                                .jamAbsenMasuk!)
                                                        .isBefore(FormatWaktu.formatJamMenit(
                                                            jamMasuk: data[i]
                                                                .jamAbsenMasuk!))
                                                      ? Colors.greenAccent[700]
                                                      : FormatWaktu.formatJamMenit(
                                                                jamMasuk: data[i]
                                                                    .jamAbsenMasuk!)
                                                            .isAtSameMomentAs(
                                                                FormatWaktu.formatJamMenit(
                                                                    jamMasuk:
                                                                        data[i].jamAbsenMasuk!))
                                                          ? Colors.greenAccent[700]
                                                          : Colors.redAccent[700]),
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
                                                    data[i]
                                                        .jamAbsenMasuk!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: black),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                children: [
                                                  const Text('Pulang'),
                                                  Text(
                                                    data[i]
                                                                .jamAbsenPulang! !=
                                                            ""
                                                        ? data[i]
                                                            .jamAbsenPulang!
                                                        : "-",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                );
                              },
                            );
                          }
                          return const Center(
                            child: Text('No data'),
                          );
                        },
                      ),
                      // );
                      // },
                    )),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
              top: 60,
              left: 20,
              right: 20,
              bottom: 0,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Icon(
                      CupertinoIcons.doc_text_search,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'History',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Obx(
          //   () => Visibility(
          //     visible: absenC.searchAbsen.isNotEmpty ? true : false,
          //     child: FloatingActionButton(
          //         heroTag: 'pdf',
          //         backgroundColor: Colors.redAccent[700],
          //         onPressed: () async {
          //           loadingDialog('Mohon menunggu...', 'Data siap dicetak');
          //           if (absenC.searchAbsen.isNotEmpty) {
          //             await absenC.exportPdf();
          //             Get.back();
          //           } else {
          //             showToast('Data absensi kosong');
          //           }
          //         },
          //         child: const Icon(
          //           FontAwesome.file_pdf_solid,
          //           color: AppColors.mainTextColor1,
          //         )),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: 'form-filter',
              backgroundColor: blue,
              onPressed: () {
                // formFilter(data![0]);
              },
              child: Icon(
                TernavIcons.lightOutline.calender_3,
                color: white,
              )),
        ],
      ),
    );
  }
}
