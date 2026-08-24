import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/constant/app_color.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/circle_icon_button.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_snack_bar.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class ProductFormPage extends StatefulWidget {
  static String id = 'product form';

  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  String? productName, desc, image, category;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel? product =
        ModalRoute.of(context)!.settings.arguments as ProductModel?;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleIconButton(
              iconPath: 'assets/icons/back_icon.svg',
              matchTextDirection: true, // Auto-flip for RTL
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            product == null ? 'Add Product' : 'Update Product',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  initialValue: product?.title,
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  initialValue: product?.description,
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Description',
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  initialValue: product?.price.toString(),
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  inputType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  initialValue: product?.image,
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image URL',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  initialValue: product?.category,
                  onChanged: (data) {
                    category = data;
                  },
                  hintText: 'Category',
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: product == null ? 'Add' : 'Update',
                  onTap: () async {
                    if (product == null &&
                        (productName == null ||
                            price == null ||
                            desc == null ||
                            image == null ||
                            category == null)) {
                      showCustomSnackBar(
                        context,
                        'Please fill all fields first!',
                        isError: true,
                      );
                      return;
                    }

                    isLoading = true;
                    setState(() {});

                    try {
                      if (product == null) {
                        await addProduct();
                      } else {
                        await updateProduct(product);
                      }

                      if (!context.mounted) return;

                      isLoading = false;
                      setState(() {});

                      showCustomSnackBar(
                        context,
                        product == null
                            ? 'Product added successfully!'
                            : 'Product updated successfully!',
                      );

                      Navigator.pop(context);
                    } catch (e) {
                      log(e.toString());

                      if (!context.mounted) return;

                      isLoading = false;
                      setState(() {});

                      showCustomSnackBar(
                        context,
                        'Something went wrong, please try again!',
                        isError: true,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id.toString(),
      title: productName ?? product.title,
      price: price ?? product.price.toString(),
      desc: desc ?? product.description,
      image: image ?? product.image,
      category: category ?? product.category,
    );
  }

  Future<void> addProduct() async {
    await AddProductService().addProduct(
      title: productName!,
      price: price!,
      desc: desc!,
      image: image!,
      category: category!,
    );
  }
}
