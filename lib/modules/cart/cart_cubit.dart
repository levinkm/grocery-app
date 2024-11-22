import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_item.dart';
import '../../models/products_model.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addItem(Product product) {
    final itemIndex =
    state.indexWhere((item) => item.product.id == product.id);
    if (itemIndex >= 0) {
      final cartItem = state[itemIndex];
      final updatedItem = CartItem(cartItem.product,
          quantity: cartItem.quantity + 1);
      state.removeAt(itemIndex);
      state.insert(itemIndex, updatedItem);
    } else {
      state.add(CartItem(product));
    }
    emit(state.toList());
  }

  void removeItem(CartItem item) {
    state.remove(item);
    emit(state.toList());
  }

  void incrementItem(CartItem item) {
    final itemIndex = state.indexOf(item);
    final updatedItem =
    CartItem(item.product, quantity: item.quantity + 1);
    state.removeAt(itemIndex);
    state.insert(itemIndex, updatedItem);
    emit(state.toList());
  }

  void decrementItem(CartItem item) {
    final itemIndex = state.indexOf(item);
    final updatedItem =
    CartItem(item.product, quantity: item.quantity - 1);
    if (updatedItem.quantity == 0) {
      state.removeAt(itemIndex);
    } else {
      state.removeAt(itemIndex);
      state.insert(itemIndex, updatedItem);
    }
    emit(state.toList());
  }

  void clearCart() {
    emit([]);
  }
}

