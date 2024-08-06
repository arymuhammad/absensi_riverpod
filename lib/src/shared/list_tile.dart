import 'package:absensi_riverpod/core/config/const.dart';
import 'package:flutter/material.dart';

class CsListTiles extends StatelessWidget {
  final Function() onTap;
  final Widget icon;
  final String title;
  final String subtitle;
  final Color colorTitle;
  const CsListTiles({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.colorTitle
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: bluelight, borderRadius: BorderRadius.circular(8)),
        child: icon,
      ),
      title: Text(
        title,
        style: TextStyle(color: colorTitle, fontWeight: FontWeight.bold),
      ),
      subtitle:
          Text(subtitle, style: TextStyle(color: greylight, fontSize: 13)),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, color: greylight),
    );
  }
}
