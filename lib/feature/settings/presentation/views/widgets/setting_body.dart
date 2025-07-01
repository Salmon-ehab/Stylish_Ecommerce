import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_in_view.dart';
import 'package:shop_ecommerce/feature/settings/presentation/delete_user_cubit/delete_user_cubit.dart';
import 'package:shop_ecommerce/feature/settings/presentation/delete_user_cubit/delete_user_state.dart';

import 'language_switch.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteUserCubit,DeleteUserState>(
      listener: (context, state) async {
        if (state is DeleteUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is DeleteUserSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Deleted successfully")),
          );
          MyNavigator.goTo(screen: const SignInView(), isReplace: true);
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 27, end: 33, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Language", style: Styles.text18W500),
                LanguageSwitcher(
                    isEnglishSelected: isEnglish, onToggle: _toggleLanguage)
              ],
            ),
           const Spacer(),
            CustomButton(
                label: "Delete Account",
                onTap: DeleteUserCubit.get(context).deleteUserI)
          ],
        ),
      ),
    );
  }

  void _toggleLanguage() async {
    // Locale newLocale =
    //     isEnglish ? const Locale('ar', 'AE') : const Locale('en', 'US');
    // await CacheHelper.saveData(
    //     key: CacheKey.language, value: newLocale.languageCode);
    // print(CacheHelper.getData(key: CacheKey.language));
    // ToDoApp.setLocale(context, newLocale); // هذه الطريقة تعيد بناء التطبيق
    setState(() {
      isEnglish = !isEnglish;
      // print(CacheHelper.getData(key: CacheKey.language));
    });
  }
}
