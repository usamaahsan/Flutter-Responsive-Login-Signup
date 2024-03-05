import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:materialloginsignup/styles/colors.dart';

class Styles{
  
  static ThemeData themeData(){
    return ThemeData(
      fontFamily: 'mainfont',
      scaffoldBackgroundColor: lightBgcolor,
      primaryColor: primaryColor,
      useMaterial3: true,
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      textTheme: Typography.blackCupertino,
      cupertinoOverrideTheme: MaterialBasedCupertinoThemeData(materialTheme: ThemeData(
        appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light
        ),
        
      )
      )),
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: darkBgColor,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
        
      )
    );
  }
}