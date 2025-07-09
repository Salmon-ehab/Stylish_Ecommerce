import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/manager/splash_cubit.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    SplashCubit.get(context).startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgAssets.appLogo,
            height: MyResponsive.height(context, 100),
            width: MyResponsive.width(context, 124),
          ),
          const SizedBox(width: 10),
          const Text(
            "Stylish",
            style: TextStyle(
                fontFamily: 'LibreCaslonText-Bold',
                fontSize: 40,
                color: AppColor.appNameColor),
          )
        ],
      ),
    );
  }
}
