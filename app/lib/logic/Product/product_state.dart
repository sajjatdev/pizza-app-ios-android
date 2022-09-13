part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSuccessGet extends ProductState {
  final ProductModel productModel;

  ProductSuccessGet({required this.productModel});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
