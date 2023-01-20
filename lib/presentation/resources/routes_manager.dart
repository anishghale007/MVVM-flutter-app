import 'package:flutter/material.dart';
import 'package:flutter_udemy/app/dependency_injection.dart';
import 'package:flutter_udemy/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_udemy/presentation/login/login.dart';
import 'package:flutter_udemy/presentation/main/main_view.dart';
import 'package:flutter_udemy/presentation/onboarding/onboarding.dart';
import 'package:flutter_udemy/presentation/register/register.dart';
import 'package:flutter_udemy/presentation/resources/strings_manager.dart';
import 'package:flutter_udemy/presentation/splash/splash.dart';
import 'package:flutter_udemy/presentation/store_details/store_details.dart';

class Routes {

  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";

}

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.noRouteFound),
      ),
      body: Center(child: Text(AppStrings.noRouteFound),),
    ));
  }

}