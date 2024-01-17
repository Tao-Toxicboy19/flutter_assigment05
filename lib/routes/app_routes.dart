// ignore_for_file: prefer_const_constructors

import 'package:flutter_assigment05/screens/home_screen/home_screen.dart';
import 'package:flutter_assigment05/screens/product_screen/product_screen.dart';
import 'package:flutter_assigment05/screens/welcome_screen/welcome_screen.dart';

class AppRouter {
  // Router map keys

  static const String welcome = "welcome";
  static const String product = "product";
  static const String home = "home";

  static get routes => {
        welcome: (context) => WelcomeScreen(),
        product: (context) => ProductScreen(),
        home: (context) => HomeScreen()
      };
}
