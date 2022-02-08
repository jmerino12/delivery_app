import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: HomeScreen());
  }
}
