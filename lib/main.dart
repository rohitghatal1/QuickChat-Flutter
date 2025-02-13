import 'package:firt_flutter_app/userLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' : (context) => loginPage()
    },
  ));
}


