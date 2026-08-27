import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubit/product_form_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    ProductModel? product =
        ModalRoute.of(context)!.settings.arguments as ProductModel?;

    return BlocProvider(
      create: (context) => ProductFormCubit(),
      child: BlocConsumer<ProductFormCubit, ProductFormState>(
        listener: (context, state) {
          if (state is ProductFormSuccess) {
            showCustomSnackBar(context, state.message);
            Navigator.pop(context);
          } else if (state is ProductFormFailure) {
            showCustomSnackBar(context, state.errorMessage, isError: true);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ProductFormLoading,
            child: Scaffold(
              appBar: CustomAppBar(
                title: product == null ? 'Add Product' : 'Update Product',
              ),
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
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*'),
                          ),
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
                        onTap: () {
                          context.read<ProductFormCubit>().submitProduct(
                            product: product,
                            productName: productName,
                            price: price,
                            desc: desc,
                            image: image,
                            category: category,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
