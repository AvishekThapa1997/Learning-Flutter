import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppThemeData {
  static ThemeData lightAppTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      buttonColor: darkBlueishColor,
      accentColor:darkBlueishColor,
      canvasColor: creamColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color:Colors.black),
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkAppTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      buttonColor: lightBlueishColor,
      canvasColor: darkCreamColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme:  Theme.of(context).textTheme.copyWith(
            headline6: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white))));

  //Colors
  static Color creamColor = Color(0xFFF5F5F5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBlueishColor = Color(0xFF403b58);
  static Color lightBlueishColor = Vx.indigo500;
}
