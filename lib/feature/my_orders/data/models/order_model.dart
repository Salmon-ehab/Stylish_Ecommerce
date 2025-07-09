import 'package:shop_ecommerce/feature/my_orders/data/models/orders.dart';

class OrderModel {
  OrderModel({
    required this.orders,
    required this.status,
  });

  final Orders? orders;
  final bool? status;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
      status: json["status"],
    );
  }
}




