import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String? hintText;
  final TextInputType? inputType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    this.hintText,
    this.inputType,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}