class PlaceOrderResponseModel {
  PlaceOrderResponseModel({
    required this.message,
    required this.orderId,
    required this.status,
    required this.total,
  });

  final String? message;
  final int? orderId;
  final bool? status;
  final double? total;

  factory PlaceOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderResponseModel(
      message: json["message"],
      orderId: json["order_id"],
      status: json["status"],
      total: json["total"],
    );
  }
}
