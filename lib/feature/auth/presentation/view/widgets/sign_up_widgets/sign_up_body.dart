import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/helper/validator/validator_form_field.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/constant.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_in_view.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/sign_in_widgets/custom_welcome_text.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: SignUpCubit.get(context).key,
        child: Column(
          children: [
            CustomWelcomeText(welcomeText: S.of(context).signUpWelcomeText),
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
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: MyResponsive.width(context, 29),
                end: MyResponsive.width(context, 87),
                top: MyResponsive.height(context, 11),
                bottom: MyResponsive.height(context, 28),
              ),
              child: RichText(
                  text: TextSpan(
                      style: Styles.text12W400
                          .copyWith(fontFamily: Constants.appFont),
                      children: [
                    TextSpan(text: S.of(context).Byclickingthe),
                    TextSpan(
                        text: S.of(context).register,
                        style: const TextStyle(color: AppColor.orange)),
                    TextSpan(text: S.of(context).youAgreeto),
                  ])),
            ),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  MyNavigator.goTo(screen: const SignInView(), isReplace: true);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Register Success',
                    style: TextStyle(color: Colors.green),
                  )));
                }
                if (state is SignUpFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  )));
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: MyResponsive.width(context, 29),
                    end: MyResponsive.width(context, 29),
                  ),
                  child: CustomButton(
                      label: S.of(context).createAccount,
                      onTap: SignUpCubit.get(context).onPressedRegisterButton),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
