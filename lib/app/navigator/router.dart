import 'package:e_cm/app/navigator/base_screen.dart';
import 'package:e_cm/pages/page/search/search.dart';
import 'package:e_cm/pages/screen/mall/mall.dart';
import 'package:e_cm/pages/screen/notification/notification.dart';
import 'package:e_cm/pages/screen/profile/component/introduction.dart';
import 'package:e_cm/pages/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import '../../data/models/product/product.dart';
import '../../pages/page/cart/cart.dart';
import '../../pages/page/login/login.dart';
import '../../pages/page/login/register.dart';
import '../../pages/page/product_detail/product_detail.dart';
import '../../pages/screen/home/home_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const mall = 'mall';
  static const notification = 'notification';
  static const profile = 'profile';
  static const screen = 'screen';
  static const login = 'login';
  static const register = 'register';
  static const productDetail = 'productDetail';
  static const cart = 'cart';
  static const search = 'search';
  static const introduction = 'introduction';
}

class AppRouter {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return appPageRoute((_) => const HomeScreen(), settings);
      case AppRoutes.mall:
        return appPageRoute((_) => const MallScreen(), settings);
      case AppRoutes.notification:
        return appPageRoute((_) => const NotificationScreen(), settings);
      case AppRoutes.profile:
        return appPageRoute((_) => const ProfileScreen(), settings);
      case AppRoutes.login:
        return appPageRoute((_) => const LoginPage(), settings);
      case AppRoutes.register:
        return appPageRoute((_) => const RegisterPage(), settings);
      case AppRoutes.screen:
        return appPageRoute((_) => const BaseScreen(), settings);

      case AppRoutes.productDetail:
        return appPageRoute((_) => ProductDetail(products: settings.arguments as Product), settings);
      case AppRoutes.cart:
        return appPageRoute((_) => const Cart(), settings);
      case AppRoutes.search:
        return appPageRoute((_) => const Search(), settings);
      case AppRoutes.introduction:
        return appPageRoute((_) => const Introduction(), settings);
      default:
        throw "No find Screen";
    }
  }
}

MaterialPageRoute<T> appPageRoute<T>(
  Widget Function(BuildContext context) builder,
  RouteSettings settings, {
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    MaterialPageRoute(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
