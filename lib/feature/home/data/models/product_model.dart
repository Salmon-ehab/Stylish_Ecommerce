import 'package:shop_ecommerce/feature/home/data/models/category_model.dart';

class ProductModel {
  ProductModel({
    this.categoryModel,
    this.bestSeller,
    this.description,
    this.id,
    this.imagePath,
    this.isFavorite,
    this.name,
    this.price,
    this.rating,
  });

  final int? bestSeller;
  final String? description;
  final int? id;
  final String? imagePath;
  final bool? isFavorite;
  final String? name;
  final CategoryModel? categoryModel;
  final double? price;
  final double? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categoryModel: json["category"] != null
          ? CategoryModel.fromJson(json["category"] as Map<String, dynamic>)
          : null,
      bestSeller: json["best_seller"],
      description: json["description"],
      id: json["id"],
      imagePath: json["image_path"],
      isFavorite: json["is_favorite"],
      name: json["name"],
      price: json["price"],
      rating: json["rating"],
    );
  }
}
