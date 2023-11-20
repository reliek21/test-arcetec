import 'package:flutter/material.dart';
import 'package:test_arcetec/presentation/screens/dahboard/home_screen.dart';
import 'package:test_arcetec/presentation/screens/auth/login_screen.dart';
import 'package:test_arcetec/presentation/screens/dahboard/new_product_screen.dart';
import 'package:test_arcetec/presentation/screens/auth/splash_screen.dart';

class MainRoutes {
  MainRoutes._();

  static const String home = 'home';
  static const String newProduct = 'new-product';
	static const String login = 'login';
	static const String splash = '/';
}

Map<String, WidgetBuilder> mainRoutes() {
  return <String, WidgetBuilder>{
    MainRoutes.home: (_) => const HomeScreen(),
    MainRoutes.newProduct: (_) => const NewProductScreen(),
		MainRoutes.login: (_) => const LoginScreen(),
		MainRoutes.splash: (_) => const SplashScreen()
  };
}
