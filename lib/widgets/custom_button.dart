import 'package:flutter/material.dart';
import 'package:store_app/constant/app_color.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? height;

  const CustomButton({super.key, this.onTap, required this.text, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryLight, AppColors.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonShadow,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        width: double.infinity,
        height: height ?? 52,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
