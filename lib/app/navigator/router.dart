import 'package:e_cm/app/navigator/base_screen.dart';
import 'package:e_cm/pages/page/search/search.dart';
import 'package:e_cm/pages/page/splash/splash.dart';
import 'package:e_cm/pages/screen/mall/mall.dart';
import 'package:e_cm/pages/screen/notification/notification.dart';
import 'package:e_cm/pages/screen/profile/component/introduction.dart';
import 'package:e_cm/pages/screen/profile/profile.dart';
import 'package:e_cm/pages/screen/profile/profile_order_history/profile_order_history.dart';
import 'package:e_cm/pages/screen/profile/update_address/address_list.dart';
import 'package:flutter/material.dart';
import '../../data/model/product/product.dart';
import '../../pages/page/card/card.dart';
import '../../pages/page/cart/cart.dart';
import '../../pages/page/categories/categories.dart';
import '../../pages/page/login/login.dart';
import '../../pages/page/login/register.dart';
import '../../pages/page/product_detail/product_detail.dart';
import '../../pages/screen/home/home_screen.dart';
import '../../pages/screen/profile/update_address/update_address.dart';

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
  static const categories = 'categories';
  static const splash = 'splash';
  static const address = 'address';
  static const orderHistory = 'orderHistory';
  static const addressList = 'addressList';
  static const card = "card";
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
        return appPageRoute((_) =>
            ProductDetail(products: settings.arguments as Product), settings);
      case AppRoutes.cart:
        return appPageRoute((_) => const Cart(), settings);
      case AppRoutes.search:
        return appPageRoute((_) => const Search(), settings);
      case AppRoutes.introduction:
        return appPageRoute((_) => const Introduction(), settings);
      case AppRoutes.categories:
        return appPageRoute((_) => const Categories(), settings);
      case AppRoutes.splash:
        return appPageRoute((_) => const Splash(), settings);
      case AppRoutes.address:
        return appPageRoute((_) => const UpdateAddress(), settings);
      case AppRoutes.orderHistory:
        return appPageRoute((context) => const ProfileOrderHistory(), settings);
      case AppRoutes.addressList:
        return appPageRoute((context) => const AddressList(), settings);
      case AppRoutes.card:
        return appPageRoute((context) => const CardScreen(), settings);
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
