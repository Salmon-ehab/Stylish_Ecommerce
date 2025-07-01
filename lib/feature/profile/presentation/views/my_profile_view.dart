import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/update_profilr_repo/update_repo_imple.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/update_profile_manager.dart/update_profile_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/my_profile_widget/my_profile_body.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>UpdateProfileCubit(UpdateRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: const Scaffold(
        appBar: CustomAppbar(title: "Profile",),
        body: MyProfileBody(),
      ),
    );
  }
}
