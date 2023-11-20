import 'package:flutter/material.dart';
import 'package:test_arcetec/presentation/screens/home_screen.dart';
import 'package:test_arcetec/presentation/screens/new_producto_screen.dart';

class MainRoutes {
  MainRoutes._();

  static const String home = '/';
  static const String newProduct = 'new-product';
}

Map<String, WidgetBuilder> mainRoutes() {
  return <String, WidgetBuilder>{
    MainRoutes.home: (_) => const HomeScreen(),
    MainRoutes.newProduct: (_) => const NewProductScreen()
  };
}
