import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/auth/data/repo/sign_in_repo/sign_in_repo_imple.dart';
import 'package:shop_ecommerce/feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/sign_in_widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> SignInCubit(SignInRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: const Scaffold(
        backgroundColor: AppColor.white,
        appBar: CustomAppbar(appbarColor: AppColor.white,),
        body: SignInBody(),
      ),
    );
  }
}