import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData appLightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    elevation: 0.0,
  iconTheme: IconThemeData(color: Colors.deepOrange),
  titleTextStyle: TextStyle(
    color: Colors.deepOrange,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
  ),

  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
  selectedItemColor: Colors.deepOrange),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
);
ThemeData appDarkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor("#121212"),
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: HexColor("#121212"),
    elevation: 10.0,
  iconTheme:const IconThemeData(color: Colors.deepOrange),
  titleTextStyle: const TextStyle(
    color: Colors.deepOrange,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: HexColor("#121212"),
    statusBarBrightness: Brightness.light,
  ),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
  backgroundColor: HexColor("#121212"),
  selectedItemColor: Colors.deepOrange,
  unselectedItemColor:Colors.grey,),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,

    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
);