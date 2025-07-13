import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/my_favorite/presentation/views/widget/favorite_widgets/favorite_body.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(
        title: S.of(context).myfavorites,
      ),
      body:const FavoriteBody(),
    );
  }
}
