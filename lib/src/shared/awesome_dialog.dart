import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CsAwesomeDialog {
  static void showAlert(
      {required String title,
      required String body,
      required VoidCallback onCancel,
      required VoidCallback onOk,
      required BuildContext context,
      required DialogType dialogType}) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: dialogType,
      // body: Center(
      //   child: Text(body,
      //     style: TextStyle(fontStyle: FontStyle.italic),
      //   ),
      // ),
      title: title,
      desc: body,
      btnCancelOnPress: onCancel,
      btnOkIcon: Icons.check_circle,
      btnOkOnPress: onOk,
    ).show();
  }
}
