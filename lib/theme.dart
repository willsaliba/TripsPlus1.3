import 'package:flutter/material.dart';

var appTheme = ThemeData(
  brightness: Brightness.dark,

  //classic black button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
  ),

  //text
  textTheme: const TextTheme(
    //body
    bodySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.5,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
    //title
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 50,
      color: Colors.white,
    ),
    //TITLE MEDIUM: CANNOT USE
     titleSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.5,
      color: Colors.red, //for error messages
    ),
    // headline
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.white,
    ),
    
  ),
);
