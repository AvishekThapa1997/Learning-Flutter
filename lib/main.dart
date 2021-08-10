import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/cart_page.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightAppTheme(context),
      darkTheme: AppThemeData.darkAppTheme(context),
      initialRoute: AppRoute.homeRoute,
      routes: {
        AppRoute.homeRoute: (context) => HomeScreen(),
        AppRoute.loginRoute: (context) => LoginScreen(),
        AppRoute.cartRoute : (context) => CartPage()
      },
    );
    // return HomePage();
  }
}
