part of 'product_form_cubit.dart';

sealed class ProductFormState {}

final class ProductFormInitial extends ProductFormState {}

final class ProductFormLoading extends ProductFormState {}

final class ProductFormSuccess extends ProductFormState {
  final String message;
  ProductFormSuccess(this.message);
}

final class ProductFormFailure extends ProductFormState {
  final String errorMessage;
  ProductFormFailure(this.errorMessage);
}