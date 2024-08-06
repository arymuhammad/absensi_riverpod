import 'package:absensi_riverpod/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../core/config/const.dart';
import '../../../global/providers/common_providers.dart';
import '../../stock/view/cek_stock.dart';

class HeaderSection extends ConsumerWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(currentUserProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData!.levelUser!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(userData.id!),
                      const SizedBox(height: 5),
                      Text(userData.namaCabang!),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 1,
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Visibility(
                      visible: userData.cekStok! == "1" ? true : false,
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                // Get.to(
                                //     () => CekStokView(kodeCabang: userData![8]),
                                //     transition: Transition.cupertino);
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CekStock(),));
                                // print('cek stok');
                                context.goNamed(RoutesPath.stock);
                              },
                              icon: Icon(
                                // CupertinoIcons.doc_text_search,
                                FontAwesome.box_open_solid,
                                color: blue,
                                size: 30,
                              )),
                          const Text(
                            'Cek Stok\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Visibility(
                      visible: userData.level == "1" ||
                              userData.level == "9" ||
                              userData.level == "10" ||
                              userData.level == "26" ||
                              userData.level == "50"
                          ? true
                          : false,
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () async {
                                // Get.to(() => ReportSalesView(),
                                //     transition: Transition.cupertino);
                                // loadingWithIcon();
                                // await reportC.fetchSalesReport();
                                // SmartDialog.dismiss();
                              },
                              icon: Icon(
                                FontAwesome.circle_dollar_to_slot_solid,
                                color: blue,
                                size: 30,
                              )),
                          const Text(
                            'Laporan\nSales',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Visibility(
                      visible: userData.level == "1" || userData.level == "26"
                          ? true
                          : false,
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () async {
                                // Get.to(() => MonitoringAbsenView(),
                                //     transition: Transition.cupertino);
                                // absC.searchAbsen.clear();
                                // absC.userMonitor.value = "";
                              },
                              icon: Icon(
                                FontAwesome.user_tie_solid,
                                color: blue,
                                size: 30,
                              )),
                          const Text(
                            'Monitor\nAbsensi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
