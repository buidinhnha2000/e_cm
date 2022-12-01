
import 'package:e_cm/app/navigator/base_screen.dart';
import 'package:e_cm/pages/screen/login_screen/login.dart';
import 'package:e_cm/pages/screen/mall/mall.dart';
import 'package:e_cm/pages/screen/notification/notification.dart';
import 'package:e_cm/pages/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import '../../pages/screen/home_screen/home_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const login = 'login';
  static const screen = 'screen';
  static const mall = 'mall';
  static const notification = 'notification';
  static const profile = 'profile';
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
        return appPageRoute((_) => const LoginScreen(), settings);
      case AppRoutes.screen:
        return appPageRoute((_) => const BaseScreen(), settings);
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
