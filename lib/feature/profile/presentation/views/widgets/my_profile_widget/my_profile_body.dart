import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/helper/validator/validator_form_field.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/update_profile_manager.dart/update_profile_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/update_profile_manager.dart/update_profile_state.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/my_profile_widget/my_profile_image_widget.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class MyProfileBody extends StatelessWidget {
  const MyProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) async {
      if (state is UpdateFailureState) {
        AppSnackBar.showError(context: context, message: state.error);
      } else if (state is UpdateSuccessState) {
        await UserCubit.get(context).getUserDataFromAPI();
        AppSnackBar.showSuccess(
            context: context, message: "Profile updated successfully");
        MyNavigator.goToOff(context, Routes.bottomNavBarView);
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
              label: S.of(context).fullName,
              controller: UpdateProfileCubit.get(context).nameController,
              prefixIcon: SvgAssets.userIcon,
              validator: ValidatorFormField.validateName,
            ),
            CustomTextField(
              label: S.of(context).phone,
              controller: UpdateProfileCubit.get(context).phoneController,
              prefixIcon: SvgAssets.phoneIcon,
              validator: ValidatorFormField.validatePhoneNumber,
            ),
            SizedBox(height: MyResponsive.height(context, 75)),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30, end: 18),
              child: state is UpdateLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColor.appNameColor,
                    )
                  : CustomButton(
                      label:        S.of(context).save
,
                      onTap: UpdateProfileCubit.get(context).getUpdateProfile),
            )
          ],
        ),
      );
    }));
  }
}
