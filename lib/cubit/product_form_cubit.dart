import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/update_product_service.dart';

part 'product_form_state.dart';

class ProductFormCubit extends Cubit<ProductFormState> {
  ProductFormCubit() : super(ProductFormInitial());

  Future<void> submitProduct({
    required ProductModel? product,
    required String? productName,
    required String? price,
    required String? desc,
    required String? image,
    required String? category,
  }) async {
    // 1. Validation
    if (product == null &&
        (productName == null || price == null || desc == null || image == null || category == null)) {
      emit(ProductFormFailure('Please fill all fields first!'));
      return;
    }

    // 2. Loading State
    emit(ProductFormLoading());

    // 3. API Call
    try {
      if (product == null) {
        await AddProductService().addProduct(
          title: productName!,
          price: price!,
          desc: desc!,
          image: image!,
          category: category!,
        );
        emit(ProductFormSuccess('Product added successfully!'));
      } else {
        await UpdateProductService().updateProduct(
          id: product.id.toString(),
          title: productName ?? product.title,
          price: price ?? product.price.toString(),
          desc: desc ?? product.description,
          image: image ?? product.image,
          category: category ?? product.category,
        );
        emit(ProductFormSuccess('Product updated successfully!'));
      }
    } catch (e) {
      emit(ProductFormFailure('Something went wrong, please try again!'));
    }
  }
}