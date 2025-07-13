import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/search/presentation/manager/search_cubit.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class SearchWidget extends StatelessWidget {
  final bool? readOnly;
  const SearchWidget({super.key, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    final mySearchCubit = SearchCubit.get(context);
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
          readOnly: readOnly!,
          onChanged: (value) {
            if (!readOnly! && value.trim().isNotEmpty) {
              mySearchCubit.getSearchItems(quiery: value.trim());
            }
          },
          onTap: () async {
            if (readOnly == true) {
              await MyNavigator.goTo(context, Routes.searchView);
            }
            mySearchCubit.clearTextEditingController();
          },
          controller: mySearchCubit.textEditingController,
          style: const TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            prefixIcon: SvgPicture.asset(
              SvgAssets.searchIcon,
              height: 16,
              width: 16,
              fit: BoxFit.scaleDown,
            ),
            hintText: S.of(context).searchAnyproduct,
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
