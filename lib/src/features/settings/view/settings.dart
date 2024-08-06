import 'package:absensi_riverpod/core/config/base_path.dart';
import 'package:absensi_riverpod/src/shared/list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../../core/config/const.dart';
import '../../../shared/clip_header_background.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(top: 160, left: 15.0, right: 15.0),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(10),
                      children: [
                        CsListTiles(
                            onTap: () {},
                            icon: Icon(TernavIcons.bold.profile, color: blue),
                            title: 'Profile Settings',
                            colorTitle: blue,
                            subtitle: 'Update Profile'),
                        CsListTiles(
                            onTap: () {},
                            icon: Icon(TernavIcons.bold.key, color: blue),
                            title: 'Security',
                            colorTitle: blue,
                            subtitle: 'Change Password'),
                        CsListTiles(
                            onTap: () {},
                            icon: Icon(Bootstrap.database_fill_exclamation,
                                color: blue),
                            title: 'Backup & Restore',
                            colorTitle: blue,
                            subtitle: 'Backup & Restore Database'),
                        CsListTiles(
                            onTap: () {},
                            icon: Icon(Bootstrap.alarm_fill, color: blue),
                            title: 'Alarm',
                            colorTitle: blue,
                            subtitle: 'Remind me  (BETA Test)'),
                        CsListTiles(
                            onTap: () {},
                            icon: Icon(TernavIcons.bold.info_1, color: blue),
                            title: 'Info',
                            colorTitle: blue,
                            subtitle: 'about version app'),
                        CsListTiles(
                            onTap: () {},
                            icon: Icon(Icons.power_settings_new_sharp,
                                color: Colors.redAccent[700]),
                            title: 'Logout',
                            colorTitle: red,
                            subtitle: 'exit app')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
            top: 60,
            left: 20,
            right: 0,
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Icon(
                    CupertinoIcons.gear_alt_fill,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Setting',
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
