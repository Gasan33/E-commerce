import 'package:flutter/material.dart';
import 'package:shopping/Animations/Zoom2.dart';
import 'package:shopping/Constants/strings.dart';
import 'package:shopping/presintation/Screens/cart_Screen.dart';
import 'package:shopping/presintation/Screens/home_Screen.dart';
import 'package:shopping/presintation/Screens/onBoarding_Screens.dart';
import 'package:shopping/presintation/Screens/product_detals_screen.dart';
import 'package:shopping/presintation/Screens/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings) {
      // ignore: constant_pattern_never_matches_value_type
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // ignore: constant_pattern_never_matches_value_type
      case productDetalScreen:
        return MaterialPageRoute(
            builder: (_) => const ProductDetalScreen(
                  itemId: 7,
                ));
      // ignore: constant_pattern_never_matches_value_type
      case onbord:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreens());
      // ignore: constant_pattern_never_matches_value_type
      case cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      // ignore: constant_pattern_never_matches_value_type
      case zoom:
        return MaterialPageRoute(builder: (_) => const Zoom2());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
