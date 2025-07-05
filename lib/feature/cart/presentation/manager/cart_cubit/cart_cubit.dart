import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/cart/data/models/cart_model.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  final List<CartItemModel> _cartItems = [];
  static CartCubit get(context) => BlocProvider.of(context);
  
  void addToCart(ProductModel productModel, {int quantity = 1}) {
    final int index = _cartItems
        .indexWhere((item) => item.productModel.id == productModel.id);

    if (index != -1) {
      _cartItems[index] = _cartItems[index]
          .copyWith(quantity: _cartItems[index].quantity + quantity);
    } else {
      _cartItems
          .add(CartItemModel(productModel: productModel, quantity: quantity));
    }
    emit(CartUpdateState(List.from(
        _cartItems))); // برجع نفس الليست القديمة علشان البلوك ياخد باله ويرفرش هو بنفسه
  }

  void increaseQuantity(int productId) {
    final index =
        _cartItems.indexWhere((item) => item.productModel.id == productId);
    if (index != -1) {
      final currentItem = _cartItems[index];
      _cartItems[index] =
          currentItem.copyWith(quantity: _cartItems[index].quantity + 1);
      emit(CartUpdateState(List.from(
          _cartItems))); // برجع نسخة جديدة علشان البلوك ياخد باله ويرفرش هو بنفسه
    }
  }

  void decreaseQuantity(int productId) {
    final index =
        _cartItems.indexWhere((item) => item.productModel.id == productId);
    if (index != -1) {
      final currentItem = _cartItems[index];
      final newQuantity = currentItem.quantity - 1;

      if (newQuantity > 0) {
        _cartItems[index] = currentItem.copyWith(quantity: newQuantity);
      } else {
        _cartItems.removeAt(index);
      }
      emit(CartUpdateState(List.from(
          _cartItems))); // برجع نفس الليست القديمة علشان البلوك ياخد باله ويرفرش هو بنفسه
    }
  }

  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item.productModel.id == productId);
    emit(CartUpdateState(List.from(_cartItems)));
  }

  void clearCart() {
    _cartItems.clear();
    emit(CartUpdateState(List.from(_cartItems)));
  }

  double get subtotal =>
      _cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  List<CartItemModel> get items => List.unmodifiable(_cartItems);
}
