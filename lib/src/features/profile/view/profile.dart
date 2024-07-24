import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../shared/clip_header_background.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    image: AssetImage('assets/image/bgapp.jpg'),
                    fit: BoxFit.fill)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 190, left: 15.0, right: 15.0),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                             "ade muhammad",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              'IT SUPPORT',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
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
                            Row(
                              children: [
                                Icon(FontAwesome.id_badge, color: Colors.blue),
                                const SizedBox(width: 5),
                                const Text('ID'),
                              ],
                            ),
                            // Text(
                            //   '${listDataUser![0]}',
                            //   textAlign: TextAlign.center,
                            //   style:
                            //       TextStyle(fontSize: 15, color: subTitleColor),
                            // ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        // const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   children: [
                            //     Icon(TernavIcons.bold.profile,
                            //         color: mainColor),
                            //     const SizedBox(width: 5),
                            //     const Text('Username'),
                            //   ],
                            // ),
                            Text(
                              'tes',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),

                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   children: [
                            //     Icon(TernavIcons.bold.call, color: mainColor),
                            //     const SizedBox(width: 5),
                            //     const Text('Telp'),
                            //   ],
                            // ),
                            // Obx(
                            //   () => Text(
                            //     '${user.newPhone.isNotEmpty ? user.newPhone.value : listDataUser![3]}',
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         fontSize: 15, color: subTitleColor),
                            //   ),
                            // ),
                          ],
                        ),
                        // const SizedBox(height: 10),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   children: [
                            //     Icon(FontAwesome.store_solid, color: mainColor),
                            //     const SizedBox(width: 5),
                            //     const Text('Store'),
                            //   ],
                            // ),
                            // Obx(
                            //   () => Text(
                            //     '${listDataUser![2]}',
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         fontSize: 15, color: subTitleColor),
                            //   ),
                            // ),
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
      //   Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 28),
      //     child: Container(
      //       decoration: BoxDecoration(
      //           color: Colors.white, borderRadius: BorderRadius.circular(5)),
      //       height: 140,
      //       width: 140,
      //       child: Card(
      //         elevation: 4,
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(5),
      //             // side: BorderSide(width: 2, color: subTitleColor!)),
      //         child: FullScreenWidget(
      //           child: Hero(
      //             tag: 'customTag',
      //             child: ClipRect(
      //               child: listDataUser![5] != ""
      //                   ? Obx(
      //                       () => CachedNetworkImage(
      //                         imageUrl:
      //                             "${ServiceApi().baseUrl}${user.fotoProfil.value != "" ? user.fotoProfil.value : listDataUser![5]}",
      //                         fit: BoxFit.cover,
      //                         progressIndicatorBuilder:
      //                             (context, url, progress) =>
      //                                 CircularProgressIndicator(
      //                           value: progress.progress,
      //                           strokeWidth: 15,
      //                         ),
      //                         errorWidget: (context, url, error) {
      //                           return Image.network(
      //                               "ade");
      //                         },
      //                       ),
      //                     )
                       
      //                   : Image.network(
      //                       "https://ui-avatars.com/api/?name=ade",
      //                       fit: BoxFit.cover,
      //                     ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   const Positioned(
      //       top: 60,
      //       left: 20,
      //       right: 0,
      //       bottom: 0,
      //       child: Row(
      //         // mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.only(top: 1.0),
      //             child: Icon(
      //               CupertinoIcons.person_alt_circle,
      //               size: 25,
      //               color: Colors.white,
      //             ),
      //           ),
      //           SizedBox(
      //             width: 5,
      //           ),
      //           Text(
      //             'Profile',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ],
      //       ))
      ],
    ));
  }
}