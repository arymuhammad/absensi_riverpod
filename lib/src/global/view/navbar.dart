import 'package:absensi_riverpod/src/features/home/view/home.dart';
import 'package:absensi_riverpod/src/features/profile/view/profile.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/navbar_repo.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(navBarRepoProvider);
    return Scaffold(
      body: IndexedStack(index: nav, children: widgetList),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: CupertinoIcons.home, title: 'Home'),
          TabItem(icon: CupertinoIcons.doc_text_search, title: 'History'),
          TabItem(icon: CupertinoIcons.camera),
          TabItem(icon: CupertinoIcons.gear_alt, title: 'Setting'),
          TabItem(icon: CupertinoIcons.person_crop_circle, title: 'Profile'),
        ],
        initialActiveIndex: nav,
        activeColor: Colors.white,
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.blue,
        onTap: (i) {
          // if (i == 1) {
          //   ref.read(navBarRepoProvider.notifier).selectedNav(i);
          //   // loc.isLoading.value = true;
          //   // loc.searchDate.value = "";
          //   // listDataUser![12]=="1"? loc.getAllVisited(listDataUser![0]): loc.getAllAbsen(listDataUser![0]);
          // } else if (i == 2) {
          //   loginC.selectedMenu(i);
          //   loc.getLoc(listDataUser);
          // } else {
          //   loginC.selectedMenu(i);
          // }
          ref.read(navBarRepoProvider.notifier).selectedNav(i);
        },
      ),
    );
  }
}

final List<Widget> widgetList = <Widget>[
  Home(),
  // listDataUser![12]=="1"? RiwayatVisitView(userData:listDataUser!): SemuaAbsenView(data: listDataUser!),
  // AbsenView(data: listDataUser!),
  // SettingsView(listDataUser: listDataUser!),
  Profile()
];
