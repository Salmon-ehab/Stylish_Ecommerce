import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/home/data/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryModel,required this.onTap});
  final CategoryModel categoryModel;
  final  Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap:() {
            onTap(categoryModel.id!);
          },
          child: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(categoryModel.imagePath!) ,
          ),
        ),
        const SizedBox(height: 4),
         Text(
          categoryModel.title!,
          style: Styles.text10W400,
        )
      ],
    );
  }
}
