import 'package:shop_ecommerce/feature/cart/data/models/cart_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartUpdateState extends CartState {
  final List<CartItemModel> cartItems;

  CartUpdateState(this.cartItems);
}
