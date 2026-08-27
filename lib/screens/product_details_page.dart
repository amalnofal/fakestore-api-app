import 'package:flutter/material.dart';
import 'package:store_app/constant/app_color.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/bottom_add_to_cart_bar.dart';
import 'package:store_app/widgets/custom_app_bar.dart';
import 'package:store_app/widgets/feature_tag.dart';
import 'package:store_app/widgets/product_image_badge.dart';
import 'package:store_app/widgets/rating_stars.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Product Details'),
      bottomNavigationBar: const BottomAddToCartBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageBadge(product: product),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                RatingStars(rate: product.rating?.rate ?? 0.0),
                const SizedBox(width: 8),
                Text(
                  "${product.rating?.rate ?? 0.0}",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "(${product.rating?.count ?? 0} reviews)",
                  style: const TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: AppColors.dividerColor, thickness: 1),
            const SizedBox(height: 8),
            Text(
              'DESCRIPTION',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryMuted,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.secondaryText,
              ),
            ),
            const SizedBox(height: 24),
            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FeatureTag(text: "In Stock"),
                FeatureTag(text: "Free Return"),
                FeatureTag(text: "Fast Delivery"),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
