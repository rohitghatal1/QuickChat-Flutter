import 'package:firt_flutter_app/Screens/HomeScreen.dart';
import 'package:firt_flutter_app/userLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xFF1976D2),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color(0xFF64B5F6),
      ),
    ),
    home: Homescreen(),
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' : (context) => loginPage()
    },
  ));
}


