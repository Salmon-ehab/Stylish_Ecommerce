import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MyResponsive.height(context, 40),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  blurRadius: 9,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                  color: AppColor.blackColor.withOpacity(.04))
            ],
            color: AppColor.white),
        child: TextFormField(
          readOnly: true,
          onTap: () {
            // MyNavigator.goTo(screen: ()=>const SearchView());
          },
          style: const TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                vertical: 0.0, horizontal: 0.0), // قم بتعديل هذا
            prefixIcon: SvgPicture.asset(
              SvgAssets.searchIcon,
              height: 16,
              width: 16,
              fit: BoxFit.scaleDown,
            ),
            hintText: 'Search any Product..',

            hintStyle: const TextStyle(
              color: AppColor.grey5,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
        ));
  }
}








      // showSearch(
      //         context: context,
      //         delegate: SearchPage<CustomProductWidget>(
      //           items:const [
      //             CustomProductWidget(),
      //             CustomProductWidget(),
      //             CustomProductWidget(),
      //             CustomProductWidget(),
      //             CustomProductWidget(),
      //             CustomProductWidget(),
      //           ],
      //           // searchLabel: 'Search . . . ',
      //           barTheme: Theme.of(context).copyWith(
      //             appBarTheme: const AppBarTheme(
      //               elevation: 0,
      //               backgroundColor: AppColor.backGroundColor,
      //               actionsIconTheme: IconThemeData(
                      
      //               ),
      //               iconTheme: IconThemeData(
                      
      //                 color: AppColor.blackColor,
      //               ),
      //               titleTextStyle: Styles.text18W600,
      //               centerTitle: true
      //             ),
      //           ),
      //        //   suggestion: const Center(child: Text('Search for a task')),
      //           failure: const Center(child: Text('No result')),
      //           filter: (item) => [item.toString()],
      //           builder: (item) =>const CustomProductWidget(),
                
      //         ),
      //       );