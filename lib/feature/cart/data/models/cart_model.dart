import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

class CartItemModel {
  final ProductModel productModel;
  final int quantity;

  CartItemModel({required this.productModel, required this.quantity});

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
        productModel: productModel, quantity: quantity ?? this.quantity);
  } // بنعمل ميثود علشان تقدر تعمل نسخة جديدة وتعدل علي الكائن بالكمية

  double get totalPrice => (productModel.price ?? 0) * quantity;

  Map<String, dynamic> toJsonForPlaceOrder() {
    return {
      'product_id': productModel.id, 
      'quantity': quantity,
    };
  }
}
