import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/products_repository.dart';
import 'products_state.dart';


class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository productsRepository;

  ProductsCubit(this.productsRepository) : super(InitProductsState());

  Future<void> fetchProducts() async {
    try {
      emit(LoadingProductsState());
      final products = await productsRepository.getProducts();
      emit(SuccessProductsState(products));
    } catch (e) {
      emit(ErrorProductsState('Failed to load products'));
    }
  }
}
