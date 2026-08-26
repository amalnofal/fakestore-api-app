import 'package:flutter/material.dart';
import 'package:store_app/constant/app_color.dart';
import 'package:store_app/widgets/custom_button.dart';

class BottomAddToCartBar extends StatelessWidget {
  const BottomAddToCartBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: const BoxDecoration(color: AppColors.cardBackground),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.remove,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 16),
                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.add,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CustomButton(
                text: 'Add to Cart',
                height: 48,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}