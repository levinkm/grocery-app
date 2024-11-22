import '../../models/products_model.dart';

abstract class ProductsState {}

class InitProductsState extends ProductsState {}

class LoadingProductsState extends ProductsState {}

class SuccessProductsState extends ProductsState {
  final Products products;

  SuccessProductsState(this.products);
}

class ErrorProductsState extends ProductsState {
  final String message;

  ErrorProductsState(this.message);
}
