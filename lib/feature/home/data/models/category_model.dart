import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

class CategoryModel {
    CategoryModel({
        required this.description,
        required this.id,
        required this.imagePath,
        required this.products,
        required this.title,
    });

    final String? description;
    final int? id;
    final String? imagePath;
    final List<ProductModel> products;
    final String? title;

    factory CategoryModel.fromJson(Map<String, dynamic> json){ 
        return CategoryModel(
            description: json["description"],
            id: json["id"],
            imagePath: json["image_path"],
            products: json["products"] == null ? [] : List<ProductModel>.from(json["products"]!.map((x) => ProductModel.fromJson(x))),
            title: json["title"],
        );
    }

}