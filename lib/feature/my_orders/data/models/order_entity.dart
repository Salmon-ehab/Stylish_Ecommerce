import 'package:shop_ecommerce/feature/my_orders/data/models/driver_model.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/item_model.dart';

class OrderEntity {
  OrderEntity({
    required this.driver,
    required this.id,
    required this.items,
    required this.orderChangeDate,
    required this.orderDate,
    required this.shipping,
    required this.status,
    required this.subtotal,
    required this.tax,
    required this.total,
  });

  final Driver? driver;
  final int? id;
  final List<Item> items;
  final String? orderChangeDate;
  final String? orderDate;
  final double? shipping;
  final int? status;
  final double? subtotal;
  final double? tax;
  final double? total;

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
     driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
      id: json["id"],
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      orderChangeDate: json["order_change_date"],
      orderDate: json["order_date"],
      shipping: json["shipping"]?.toDouble(),
      status: json["status"],
      subtotal: json["subtotal"]?.toDouble(),
      tax: json["tax"]?.toDouble(),
      total: json["total"]?.toDouble(),
    );
  }
}
