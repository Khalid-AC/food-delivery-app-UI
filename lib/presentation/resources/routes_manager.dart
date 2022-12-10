import 'package:flutter/material.dart';
import 'package:food_delivery_ui/presentation/resources/strings_manager.dart';
import 'package:food_delivery_ui/presentation/views/login_view/view/login_view.dart';
import 'package:food_delivery_ui/presentation/views/on_boarding_view/view/on_boarding_view.dart';
import 'package:food_delivery_ui/presentation/views/sign_up_view/view/sign_up_view.dart';
import 'package:food_delivery_ui/presentation/views/splash_view/splash_view.dart';

class RoutesManager {
  //
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";


}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesManager.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => const  SplashView());
        }

      //
      case RoutesManager.onBoardingRoute:
        {
          return MaterialPageRoute(builder: (_) => OnBoardingView());
        }

      //
      case RoutesManager.loginRoute:
        {
          return MaterialPageRoute(builder: (_) => const LoginView());
        }

      //
      case RoutesManager.signUpRoute:
        {
          return MaterialPageRoute(builder: (_) => const SignUpView());
        }

      default:
        {
          return undefinedRoute();
        }
    }
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.pageNotFound),
        ),
        body: const Center(
          child: Text(StringsManager.pageNotFound),
        ),
      );
    });
  }
}
