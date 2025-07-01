import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/helper/validator/validator_form_field.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/core/widgets/bottom_nav_bar.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/update_profile_manager.dart/update_profile_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/update_profile_manager.dart/update_profile_state.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/my_profile_widget/my_profile_image_widget.dart';

class MyProfileBody extends StatelessWidget {
  const MyProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) async {
      if (state is UpdateFailureState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error)),
        );
      } else if (state is UpdateSuccessState) {
        await UserCubit.get(context).getUserDataFromAPI();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile updated successfully")),
        );
        MyNavigator.goTo(screen: const BottomNavBarWidget(), isReplace: true);
      }
    }, builder: (context, state) {
      return Form(
        key: UpdateProfileCubit.get(context).key,
        child: Column(
          children: [
            const SizedBox(height: 25),
            MyProfileImageWidget(
              onImagePicked: (image) {
                UpdateProfileCubit.get(context).image = image;
              },
            ),
            SizedBox(height: MyResponsive.height(context, 68)),
            CustomTextField(
              label: "Full Name",
              controller: UpdateProfileCubit.get(context).nameController,
              prefixIcon: SvgAssets.userIcon,
              validator: ValidatorFormField.validateName,
            ),
            CustomTextField(
              label: "Phone",
              controller: UpdateProfileCubit.get(context).phoneController,
              prefixIcon: SvgAssets.phoneIcon,
              validator: ValidatorFormField.validatePhoneNumber,
            ),
            SizedBox(height: MyResponsive.height(context, 75)),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30, end: 18),
              child: CustomButton(
                  label: "Save",
                  onTap: UpdateProfileCubit.get(context).getUpdateProfile),
            )
          ],
        ),
      );
    }));
  }
}
