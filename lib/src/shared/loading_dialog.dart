import 'package:flutter/material.dart';

class CsLoading {
  static void showLoading({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        // title: Text(title),
        content: SizedBox(
          height: 60,
          child: Center(child: Column(
            children: [
              CircularProgressIndicator(),
              Text('Loading...')
            ],
          ))),
      ),
    );
  }
}
