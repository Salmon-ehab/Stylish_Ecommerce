import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/settings/data/delete_user_repo/delete_user_repo_imple.dart';
import 'package:shop_ecommerce/feature/settings/presentation/delete_user_cubit/delete_user_cubit.dart';
import 'package:shop_ecommerce/feature/settings/presentation/views/widgets/setting_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteUserCubit(
          DeleteUserRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: const Scaffold(
        appBar: CustomAppbar(title: "settings"),
        body: SettingBody(),
      ),
    );
  }
}
