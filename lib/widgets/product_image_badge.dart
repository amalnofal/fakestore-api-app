import 'package:flutter/material.dart';
import 'package:store_app/constant/app_color.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/feature_tag.dart';

class ProductImageBadge extends StatelessWidget {
  final ProductModel product;

  const ProductImageBadge({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryLight.withValues(alpha: 0.09),
            AppColors.primary.withValues(alpha: 0.06),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 50),
              ),
            ),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: FeatureTag(text: product.category),
          ),
        ],
      ),
    );
  }
}
