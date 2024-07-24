import 'package:flutter/material.dart';

class CsIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  const CsIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}
