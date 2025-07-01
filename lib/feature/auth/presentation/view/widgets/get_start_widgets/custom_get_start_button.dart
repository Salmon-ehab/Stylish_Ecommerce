import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_up_view.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class CustomGetStartButton extends StatelessWidget {
  const CustomGetStartButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        MyNavigator.goTo(screen: ()=>const SignUpView());
      },
      child: Container(
        height:MyResponsive.height(context, 55) ,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(4),
          border:Border.all(
            width: 2,
            color: AppColor.appNameColor
          ) 
        ),
        child: Center(child:  Text(S.of(context).register,style:Styles.text23W600.copyWith(color: AppColor.appNameColor) ,)),
      ),
    );
  }
}