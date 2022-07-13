// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {

  static Color purple = Colors.deepPurple.shade300;
  static Color grey = Colors.grey.shade400;

  static LinearGradient gradientHome = 
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.grey.shade600,
        Colors.grey.shade800,
        Colors.grey.shade900,
      ],
      stops: [
        0.3,
        0.6,
        1.0
      ]
    );
  
  static ThemeData theme = ThemeData(
    fontFamily: 'RobotoMono',
    backgroundColor: Colors.grey.shade900,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: purple,
    hintColor: Colors.white,
    // primarySwatch: Colors.red,
    splashColor: Colors.grey.shade900,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade300,
      splashColor: Colors.black54,
      foregroundColor: Colors.white,
      elevation: 20.0,
      
    ),
    iconTheme: IconThemeData(color: grey),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 14, color: grey),
      headline2: TextStyle(fontSize: 16, color: grey),
      headline3: TextStyle(
        fontSize: 35, 
        fontWeight: FontWeight.bold,
        color: grey, 
        letterSpacing: 2.2, 
        shadows: [
          Shadow(
            offset: Offset(4.0, 4.0),
            blurRadius: 5.0,
            color: Colors.black87
          )
        ]
      ),
      headline4: TextStyle(fontSize: 14, color: Colors.grey.shade800, fontWeight: FontWeight.bold),
      headline5: TextStyle(
        fontSize: 20, 
        fontWeight: FontWeight.bold,
        color: grey, 
        // letterSpacing: , 
        shadows: [
          Shadow(
            offset: Offset(4.0, 4.0),
            blurRadius: 5.0,
            color: Colors.black87
          )
        ]
      ),
    )
  );
}

