import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/png.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 48,
      backgroundImage:image!= null? NetworkImage(image!):const AssetImage(PngAssets.profileImage),
    );
  }
}
