import 'package:flutter/material.dart';

class CsElevatedButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const CsElevatedButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
