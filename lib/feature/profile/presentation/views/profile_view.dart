import 'package:flutter/material.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/profile_widget/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(),
    );
  }
}
