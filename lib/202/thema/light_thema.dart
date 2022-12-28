import 'package:flutter/material.dart';

class LighTheme {
  final _lightColor = _LightColor(); // renk sınıfından çağırıp themada kullanmak için nesne oluşturduk 

  late ThemeData theme; // dışarıdan renk almak için initial etmemiz lazım late kullandım 

  LighTheme() { // constructor gibi 
    theme = ThemeData(  // mainde sınıf.thema diyip çağırabiliriz :)
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(onPrimary: Colors.purple, onSecondary: _lightColor.blueMenia)),
        colorScheme: const ColorScheme.light(),
        // checkboxTheme: CheckboxThemeData(
        //     fillColor: MaterialStateProperty.all(Colors.green), side: const BorderSide(color: Colors.green)),
        textTheme:
            ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

// renk sınıfımız 
class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 37, 5, 5);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
}