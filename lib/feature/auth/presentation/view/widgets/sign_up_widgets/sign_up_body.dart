import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/sign_in_widgets/custom_welcome_text.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/sign_up_widgets/sign_up_fields.dart';
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
            const SignUpFields(),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  MyNavigator.goToOff(context, Routes.signInView);
                  AppSnackBar.showSuccess(
                      context: context,
                      message: "You’re all set! pLease sign in");
                }
                if (state is SignUpFailureState) {
                  AppSnackBar.showError(context: context, message: state.error);
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: MyResponsive.width(context, 29),
                    end: MyResponsive.width(context, 29),
                  ),
                  child: state is SignUpLoadingState
                      ? const CircularProgressIndicator(
                          color: AppColor.appNameColor,
                        )
                      : CustomButton(
                          label: S.of(context).createAccount,
                          onTap:
                              SignUpCubit.get(context).onPressedRegisterButton),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
