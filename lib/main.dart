import 'package:camera/camera.dart';
import 'package:firt_flutter_app/Screens/CameraScreen.dart';
import 'package:firt_flutter_app/Screens/HomeScreen.dart';
import 'package:firt_flutter_app/userLogin.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal, brightness: Brightness.light),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            elevation: 0),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: Colors.white)),
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          indicatorSize: TabBarIndicatorSize.tab,
        )),
    home: Homescreen(),
    debugShowCheckedModeBanner: false,
    // initialRoute: 'login',
    routes: {'login': (context) => loginPage()},
  ));
}
