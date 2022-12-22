import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {

  static Color primaryColor = Color(0xff39A552) ;
  static Color goldColor = Color(0xffF2D352) ;
  static Color brownColor = Color(0xffCF7E48) ;
  static Color blueColor = Color(0xff003E90) ;
  static Color redColor = Color(0xffC91C22) ;
  static Color pinkColor = Color(0xffED1E79) ;
  static Color openBlueColor = Color(0xff4882CF) ;

 static ThemeData lightTheme = ThemeData(
   scaffoldBackgroundColor: Colors.white,
   appBarTheme: AppBarTheme(
     color: primaryColor ,
         elevation: 0 ,
   ) ,
   textTheme: TextTheme(
     headline1: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.w400) ,
     headline2: TextStyle(color: Colors.white , fontSize: 22 , fontWeight: FontWeight.bold) ,
     subtitle1: TextStyle(color: Colors.black , fontSize:  20 , fontWeight: FontWeight.bold),
   ) ,
 );

}