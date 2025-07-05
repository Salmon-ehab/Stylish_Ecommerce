import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/text_head_line.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/profile_widget/custom_profile_image.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/profile_widget/profile_tabs.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 23),
                const TextHeadLine(title: "Profile"),
                const SizedBox(height: 32),
                CustomProfileImage(
                    image: state is UserSuccessState &&
                            state.userModel.imagePath != null
                        ? state.userModel.imagePath
                        : null),
                const SizedBox(height: 19),
                Text(
                  state is UserSuccessState
                      ? state.userModel.name!
                      : "User full Name",
                  style:
                      Styles.text18W600.copyWith(color: AppColor.appNameColor),
                ),
              const ProfileTabs()
              ],
            );
          })),
    );
  }
}
