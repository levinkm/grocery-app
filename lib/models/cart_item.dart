import 'package:grocerygo/models/products_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, {this.quantity = 1});
}
