import 'dart:convert';
import 'package:absensi_riverpod/core/config/base_path.dart';
import 'package:absensi_riverpod/src/features/home/provider/home_provider.dart';
import 'package:absensi_riverpod/src/features/home/view/header_section.dart';
import 'package:absensi_riverpod/src/features/home/view/date_time_section.dart';
import 'package:absensi_riverpod/src/features/profile/view/profile.dart';
import 'package:absensi_riverpod/src/global/controller/shared_prefs_controller.dart';
import 'package:absensi_riverpod/src/global/providers/common_providers.dart';
import 'package:absensi_riverpod/src/global/repository/shared_prefs_repo.dart';
import 'package:absensi_riverpod/src/model/login_model.dart';
import 'package:absensi_riverpod/src/shared/alert_dialog.dart';
import 'package:absensi_riverpod/src/shared/awesome_dialog.dart';
import 'package:absensi_riverpod/src/shared/icon_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../global/controller/init_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/cache_network_image.dart';
import '../../../shared/clip_header_background.dart';
import '../../login/view/login.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(sharedPrefsControllerPovider);
    final userData = ref.read(currentUserProvider);
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
                      image: AssetImage('${BasePaths.baseImagePath}/bgapp.jpg'),
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
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => Profile()));
                            context.goNamed(RoutesPath.profile);
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
                                  child: userData!.foto != ""
                                      ? CsCacheNetImg(
                                          url:
                                              '${BasePaths.baseProdUrl}/${userData.foto!}',
                                        )
                                      : Image.network(
                                          "https://ui-avatars.com/api/?name=${userData.nama!}",
                                          fit: BoxFit.cover,
                                        ),
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
                              userData.nama!,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          CsAwesomeDialog.showAlert(
                              title: 'Information',
                              body: 'Anda yakin ingin keluar?',
                              onCancel: () {},
                              onOk: () {
                                auth.clear();
                                context.go(RoutesPath.login);
                                // Navigator.of(context).pushReplacement(
                                //     MaterialPageRoute(
                                //         builder: (context) => LoginView()));
                                ref.read(loggedInProvider.notifier).state =
                                    false;
                              },
                              context: context,
                              dialogType: DialogType.question);
                          // AlertService.showAlert(
                          //     title: 'Information',
                          //     body: 'Anda yakin ingin keluar?',
                          //     onCancel: () {},
                          //     onOk: () {},
                          //     context: context);
                          // auth.setAuth(false);
                          // auth.clear();
                          // context.go(RoutesPath.login);
                          // ref.read(loggedInProvider.notifier).state = false;

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
                        const HeaderSection(),
                        DateTimeSection(),
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
