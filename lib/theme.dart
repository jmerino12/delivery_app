import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20d0c4);
  static final dark = Color(0xFF03091e);
  static final grey = Color(0xFF212738);
  static final ligthGrey = Color(0xFFBBBBBB);
  static final veryLigthGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
}

final deliveryGradiant = [DeliveryColors.green, DeliveryColors.purple];

final _borderLigth = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
        color: DeliveryColors.veryLigthGrey,
        width: 2,
        style: BorderStyle.solid));

final _borderDark = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
        color: DeliveryColors.grey, width: 2, style: BorderStyle.solid));

final ligthTheme = ThemeData(
    canvasColor: DeliveryColors.white,
    scaffoldBackgroundColor: DeliveryColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.purple, displayColor: DeliveryColors.purple),
    inputDecorationTheme: InputDecorationTheme(
        border: _borderLigth,
        enabledBorder: _borderLigth,
        focusedBorder: _borderLigth,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: DeliveryColors.purple),
        hintStyle:
            GoogleFonts.poppins(color: DeliveryColors.ligthGrey, fontSize: 10)),
    iconTheme: IconThemeData(color: DeliveryColors.purple),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: DeliveryColors.purple));

final darkTheme = ThemeData(
    canvasColor: DeliveryColors.grey,
    scaffoldBackgroundColor: DeliveryColors.dark,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.green, displayColor: DeliveryColors.green),
    inputDecorationTheme: InputDecorationTheme(
        border: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: DeliveryColors.white),
        filled: true,
        fillColor: DeliveryColors.grey,
        hintStyle:
            GoogleFonts.poppins(color: DeliveryColors.white, fontSize: 10)),
    iconTheme: IconThemeData(color: DeliveryColors.white),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: DeliveryColors.white));
