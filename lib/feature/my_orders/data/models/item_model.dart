class Item {
  Item({
    required this.description,
    required this.id,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.totalPrice,
  });

  final String? description;
  final int? id;
  final String? imagePath;
  final String? name;
  final double? price;
  final int? quantity;
  final double? rating;
  final double? totalPrice;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      description: json["description"],
      id: json["id"],
      imagePath: json["image_path"],
      name: json["name"],
      price: json["price"]?.toDouble(),
      quantity: json["quantity"],
      rating: json["rating"]?.toDouble(),
      totalPrice: json["total_price"]?.toDouble(),
    );
  }
}
