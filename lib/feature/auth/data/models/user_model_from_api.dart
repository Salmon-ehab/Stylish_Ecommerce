import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

class UserModelFromApi {
  UserModelFromApi({
    this.email,
    this.favoriteProducts,
    this.id,
    this.imagePath,
    this.name,
    this.phone,
  });

  final String? email;
  final List<ProductModel>? favoriteProducts;
  final int? id;
  final String? imagePath;
  final String? name;
  final String? phone;

  factory UserModelFromApi.fromJson(Map<String, dynamic> json) {
    return UserModelFromApi(
      email: json["email"],
      favoriteProducts: json["favorite_products"] == null
          ? []
          : (json["favorite_products"]
                  as List<dynamic>) 
              .map((x) => ProductModel.fromJson(
                  x as Map<String, dynamic>)) 
              .toList(),
      id: json["id"],
      imagePath: json["image_path"],
      name: json["name"],
      phone: json["phone"],
    );
  }
}
