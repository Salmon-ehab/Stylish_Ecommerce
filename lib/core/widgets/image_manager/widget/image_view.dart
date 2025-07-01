// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shop_ecommerce/core/widgets/image_manager/cubit/image_manager_cubit.dart';
// import 'package:shop_ecommerce/core/widgets/image_manager/cubit/image_manager_state.dart';
// import 'package:shop_ecommerce/core/utils/png.dart';

// class CustomProfileImagePicker extends StatelessWidget {
//   const CustomProfileImagePicker({
//     super.key,
//     required this.onImagePicked,
//     this.initialImageUrl,
//   });

//   final void Function(XFile image) onImagePicked;
//   final String? initialImageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ImageManagerCubit(),
//       child: BlocConsumer<ImageManagerCubit, ImageManagerState>(
//         listener: (context, state) {
//           if (state is ImageManagerPickImage) {
//             onImagePicked(state.image);
//           }
//         },
//         builder: (context, state) {
//           ImageProvider imageProvider;

//           if (state is ImageManagerPickImage) {
//             imageProvider = FileImage(File(state.image.path));
//           } else if (initialImageUrl != null && initialImageUrl!.isNotEmpty) {
//             imageProvider = NetworkImage(initialImageUrl!);
//           } else {
//             imageProvider = const AssetImage(PngAssets.profileImage);
//           }
//           return InkWell(
//             onTap: () => ImageManagerCubit.get(context).getImage(),
//             child: CircleAvatar(
//               radius: 48,
//               backgroundImage: imageProvider,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
