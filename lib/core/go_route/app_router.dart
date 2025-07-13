import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_ecommerce/core/go_route/custom_page_transitions.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/widgets/bottom_nav_bar.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/get_start_view.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_in_view.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_up_view.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/cart_view.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/check_out_view.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/trending_product_view.dart';
import 'package:shop_ecommerce/feature/my_favorite/presentation/views/favorite_view.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/order_entity.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/my_order_view.dart';
import 'package:shop_ecommerce/feature/order_details.dart/presentation/views/order_details_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/my_profile_view.dart';
import 'package:shop_ecommerce/feature/search/presentation/views/search_view.dart';
import 'package:shop_ecommerce/feature/settings/presentation/views/setting_view.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/onboarding_view.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/splash_view.dart';
      final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: Routes.splashView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const SplashView(), key: state.pageKey)),
      GoRoute(
          path: Routes.getStartView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const GetStartView(), key: state.pageKey)),
      GoRoute(
          path: Routes.onboardingView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const OnboardingView(), key: state.pageKey)),
      GoRoute(
          path: Routes.signInView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const SignInView(), key: state.pageKey)),
      GoRoute(
          path: Routes.signUpView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const SignUpView(), key: state.pageKey)),
      GoRoute(
          path: Routes.bottomNavBarView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const BottomNavBarWidget(), key: state.pageKey)),
      GoRoute(
          path: Routes.cartView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const CartView(), key: state.pageKey)),
      GoRoute(
          path: Routes.trendingProductView,
          pageBuilder: (context, state) {
            final product = state.extra as ProductModel;
            return buildPageWithTransition(
                child: TrendingProductView(
                  productModel: product,
                ),
                key: state.pageKey);
          }),
      GoRoute(
          path: Routes.orderDetailsView,
          pageBuilder: (context, state) {
            final order = state.extra as OrderEntity;
            return buildPageWithTransition(
                child: OrderDetailsView(orderEntity: order),
                key: state.pageKey);
          }),
      GoRoute(
          path: Routes.searchView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const SearchView(), key: state.pageKey)),
      GoRoute(
          path: Routes.myProfileView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const MyProfileView(), key: state.pageKey)),
      GoRoute(
          path: Routes.myOrderView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const MyOrderView(), key: state.pageKey)),
      GoRoute(
          path: Routes.myFavoriteView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const FavoriteView(), key: state.pageKey)),
      GoRoute(
          path: Routes.settingView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const SettingView(), key: state.pageKey)),
      GoRoute(
          path: Routes.checkOutView,
          pageBuilder: (context, state) => buildPageWithTransition(
              child: const CheckOutView(), key: state.pageKey)),
    ],
  );
}
