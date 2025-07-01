import 'package:flutter/material.dart';

import 'package:shop_ecommerce/feature/home/presentation/views/widgets/custom_app_logo.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppLogo(),
      body: HomeBody(),
    );
  }
}
