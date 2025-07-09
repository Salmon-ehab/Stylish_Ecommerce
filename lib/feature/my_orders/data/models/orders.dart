import 'package:shop_ecommerce/feature/my_orders/data/models/order_entity.dart';

class Orders {
  Orders({
    required this.active,
    required this.canceled,
    required this.completed,
  });

  final List<OrderEntity> active;
  final List<OrderEntity> canceled;
  final List<dynamic> completed;

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      active: json["active"] == null
          ? []
          : List<OrderEntity>.from(json["active"]!.map((x) => OrderEntity.fromJson(x))),
      canceled: json["canceled"] == null
          ? []
          : List<OrderEntity>.from(json["canceled"]!.map((x) => OrderEntity.fromJson(x))),
      completed: json["completed"] == null
          ? []
          : List<OrderEntity>.from(json["completed"]!.map((x) => OrderEntity.fromJson(x))),
    );
  }
}