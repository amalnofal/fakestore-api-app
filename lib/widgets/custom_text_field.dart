import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/constant/app_color.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String? hintText;
  final TextInputType? inputType;
  final bool obscureText;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;

  const CustomTextField({
    super.key,
    this.hintText,
    this.inputType,
    this.onChanged,
    this.obscureText = false,
    this.maxLines = 1,
    this.inputFormatters,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final customBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.inputBorder, width: 1.1),
      borderRadius: BorderRadius.circular(16),
    );

    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: inputType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.secondaryText),
        filled: true,
        fillColor: AppColors.cardBackground,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        enabledBorder: customBorder,
        border: customBorder,
        focusedBorder: customBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}