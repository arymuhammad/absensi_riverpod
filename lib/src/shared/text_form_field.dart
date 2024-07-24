import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CsTexFormField extends ConsumerWidget {
  final String label;
  final bool obscure;
  final Widget icon;
  final String? helperText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CsTexFormField(
      {super.key,
      required this.label,
      required this.obscure,
      required this.icon,
      this.helperText,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        // initialValue: 'admin@gmail.com',
        maxLength: 20,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          suffixIcon: icon,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          helperText: helperText,
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
