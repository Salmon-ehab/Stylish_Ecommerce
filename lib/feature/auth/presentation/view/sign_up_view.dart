import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/auth/data/repo/sign_up_repo/sign_up_imple.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/sign_up_widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(SignUpImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: const Scaffold(
        backgroundColor: AppColor.white,
        appBar: CustomAppbar(
          appbarColor: AppColor.white,
        ),
        body: SignUpBody(),
      ),
    );
  }
}
