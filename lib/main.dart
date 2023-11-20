import 'package:flutter/material.dart';
import 'package:test_arcetec/presentation/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Arcetec',
      routes: mainRoutes(),
      initialRoute: MainRoutes.home,
    );
  }
}