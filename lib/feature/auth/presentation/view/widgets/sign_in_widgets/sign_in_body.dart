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
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_in_cubit/sign_in_state.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/sign_in_widgets/custom_welcome_text.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          UserCubit.get(context).getUserData(user: state.userResponseApi.user!);
          MyNavigator.goToOff(context, Routes.bottomNavBarView);
          AppSnackBar.showSuccess(
              context: context,
              message: "Successfully logged in.");
        }
        if (state is SignInFailureState) {
          AppSnackBar.showError(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: SignInCubit.get(context).key,
          child: Column(
            children: [
              CustomWelcomeText(welcomeText: S.of(context).signInWelcomText),
              CustomTextField(
                label: S.of(context).email,
                controller: SignInCubit.get(context).emailController,
                prefixIcon: SvgAssets.emailIcon,
                validator: ValidatorFormField.validateEmail,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: S.of(context).password,
                controller: SignInCubit.get(context).passwordController,
                prefixIcon: SvgAssets.passwordIvon,
                isPassword: true,
                validator: ValidatorFormField.validatePassword,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: MyResponsive.width(context, 29),
                    end: MyResponsive.width(context, 29),
                    top: MyResponsive.height(context, 56)),
                child: state is SignInLoadingState
                    ? const CircularProgressIndicator(
                        color: AppColor.appNameColor,
                      )
                    : CustomButton(
                        label: S.of(context).login,
                        onTap: SignInCubit.get(context).onLoginPressed),
              )
            ],
          ),
        );
      },
    ));
  }
}
