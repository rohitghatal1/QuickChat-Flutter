import 'package:firt_flutter_app/Screens/HomeScreen.dart';
import 'package:firt_flutter_app/userLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,
          brightness: Brightness.light),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0
      )
    ),
    home: Homescreen(),
    debugShowCheckedModeBanner: false,
    // initialRoute: 'login',
    routes: {
      'login' : (context) => loginPage()
    },
  ));
}


