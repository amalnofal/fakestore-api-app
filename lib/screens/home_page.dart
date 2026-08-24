import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_products_service.dart';
import 'package:store_app/widgets/circle_icon_button.dart';
import 'package:store_app/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFEEEEF8),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleIconButton(iconPath: 'assets/icons/add_icon.svg'),

              const Text(
                "New Trend",
                style: TextStyle(
                  color: Color(0xFF3D3B8E),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              CircleIconButton(iconPath: 'assets/icons/cart_icon.svg'),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFEEEEF8),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 75),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 80,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
