import 'package:flutter/material.dart';
import 'package:food_delivery_ui/presentation/resources/routes_manager.dart';
import 'package:food_delivery_ui/presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  //
  MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //
      debugShowCheckedModeBanner: false,

      //
      theme: ThemeManager.getApplicationTheme(),

      //
      initialRoute: RoutesManager.splashRoute,

      //
      onGenerateRoute: RoutesGenerator.getRoute,
    );
  }
}
