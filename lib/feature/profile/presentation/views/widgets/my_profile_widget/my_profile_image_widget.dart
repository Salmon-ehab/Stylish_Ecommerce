import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/my_profile_widget/image_view.dart';

class MyProfileImageWidget extends StatelessWidget {
  const MyProfileImageWidget({super.key, required this.onImagePicked});
  final void Function(XFile) onImagePicked;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomProfileImagePicker(onImagePicked: onImagePicked),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.white, width: 3)),
        )
      ],
    );
  }
}
