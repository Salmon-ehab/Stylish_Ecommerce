import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/png.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/get_start_widgets/get_start_buttons_widget.dart';

class GetStartBody extends StatelessWidget {
  const GetStartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(PngAssets.getStartViewImage),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.0),
              ],
              stops: const [0.0, 0.7],
            ),
          ),
        ),
      const  GetStartButtonsWidget()
      ],
    );
  }
}
