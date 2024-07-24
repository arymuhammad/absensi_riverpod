import 'package:absensi_riverpod/src/global/controller/shared_prefs_controller.dart';
import 'package:absensi_riverpod/src/shared/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/cache_network_image.dart';
import '../../../shared/clip_header_background.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(sharedPrefsControllerPovider);
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/bgapp.jpg'),
                      fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(
                            //     () => ProfilView(listDataUser: listDataUser!));
                            context.go(RoutesPath.profile);
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: const BorderSide(
                                    width: 3, color: Colors.white)),
                            child: ClipOval(
                              child: Hero(
                                tag: 'pro',
                                transitionOnUserGestures: true,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.grey[200],
                                  child: 
                                  
                                  // listDataUser![5] != ""
                                      // ? 
                                      CsCacheNetImg(url: '',)
                                      // :
                                      //  Image.network(
                                      //     "",
                                      //     fit: BoxFit.cover,
                                      //   ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selamat Datang',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              "ade",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          auth.clear();
                          context.go(RoutesPath.login);
                          // promptDialog(context, 'Anda yakin ingin keluar?');
                        },
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 35,
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // CardInfoMenu(userData: listDataUser!),
                        // listDataUser![12] == "1"
                        //     ? SummaryAbsenArea(userData: listDataUser!)
                        //     : SummaryAbsen(userData: listDataUser!)
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
