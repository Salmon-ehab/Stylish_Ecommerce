import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/validator/validator_form_field.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/sign_up_widgets/sign_up_rich_text.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: S.of(context).fullName,
          controller: SignUpCubit.get(context).nameController,
          prefixIcon: SvgAssets.userIcon,
          validator: ValidatorFormField.validateName,
        ),
        CustomTextField(
          label: S.of(context).phone,
          controller: SignUpCubit.get(context).phoneController,
          validator: ValidatorFormField.validatePhoneNumber,
          prefixIcon: SvgAssets.phoneIcon,
        ),
        CustomTextField(
          label: S.of(context).email,
          controller: SignUpCubit.get(context).emailController,
          prefixIcon: SvgAssets.emailIcon,
          validator: ValidatorFormField.validateEmail,
        ),
        CustomTextField(
          label: S.of(context).password,
          controller: SignUpCubit.get(context).passwordController,
          prefixIcon: SvgAssets.passwordIvon,
          isPassword: true,
          validator: ValidatorFormField.validatePassword,
        ),
        CustomTextField(
          label: S.of(context).confirmPassword,
          controller: SignUpCubit.get(context).confirmPasswordController,
          prefixIcon: SvgAssets.passwordIvon,
          isPassword: true,
          validator: ValidatorFormField.validateConfirmPassword,
        ),
        const SignUpRichText()
      ],
    );
  }
}
