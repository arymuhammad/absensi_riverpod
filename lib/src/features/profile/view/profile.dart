import 'package:absensi_riverpod/core/config/base_path.dart';
import 'package:absensi_riverpod/core/config/const.dart';
import 'package:absensi_riverpod/src/features/profile/view/photo_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../global/providers/common_providers.dart';
import '../../../shared/clip_header_background.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataUser = ref.watch(currentUserProvider);
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
                        image:
                            AssetImage('${BasePaths.baseImagePath}/bgapp.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 190, left: 15.0, right: 15.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                  height: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(),
                          Container(),
                          Column(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  dataUser!.nama!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  dataUser.levelUser!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Divider(thickness: 1),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(FontAwesome.id_badge,
                                        color: Colors.blue),
                                    SizedBox(width: 5),
                                    Text('ID'),
                                  ],
                                ),
                                Text(
                                  dataUser.id!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15, color: grey),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            // const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(TernavIcons.bold.profile, color: blue),
                                    const SizedBox(width: 5),
                                    const Text('Username'),
                                  ],
                                ),
                                Text(
                                  dataUser.username!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),

                            const Divider(
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(TernavIcons.bold.call, color: blue),
                                    const SizedBox(width: 5),
                                    const Text('Telp'),
                                  ],
                                ),
                                Text(
                                  dataUser.noTelp!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15, color: grey),
                                ),
                              ],
                            ),
                            // const SizedBox(height: 10),
                            const Divider(
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(FontAwesome.store_solid, color: blue),
                                    const SizedBox(width: 5),
                                    const Text('Store'),
                                  ],
                                ),
                                Text(
                                  dataUser.namaCabang!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15, color: grey),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const PhotoFrofile(),
            const Positioned(
                top: 60,
                left: 20,
                right: 0,
                bottom: 0,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Icon(
                        CupertinoIcons.person_alt_circle,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
          ],
        ));
  }
}
