class SliderModel {
    SliderModel({
        required this.description,
        required this.id,
        required this.imagePath,
        required this.title,
    });

    final String? description;
    final int? id;
    final String? imagePath;
    final String? title;

    factory SliderModel.fromJson(Map<String, dynamic> json){ 
        return SliderModel(
            description: json["description"],
            id: json["id"],
            imagePath: json["image_path"],
            title: json["title"],
        );
    }

}