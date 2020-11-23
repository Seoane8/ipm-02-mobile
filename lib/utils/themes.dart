import 'package:flutter/material.dart';
import 'package:image_analyzer/utils/colors.dart';

class Themes {
  static ThemeData darkTheme(BuildContext context){
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: white,
      scaffoldBackgroundColor: graphite,
      accentColor: white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        size: 30,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
          ),
          padding: MaterialStateProperty.all(
              EdgeInsets.fromLTRB(30, 15, 30, 15)
          ),
          side: MaterialStateProperty.all(
              BorderSide(width: 2, color: white)
          ),
      )),
      textTheme: TextTheme(
        subtitle1: TextStyle(
          fontSize: 25,
        ),
        button: TextStyle(
          fontSize: 20,
        ),
      )
    );
  }

  static ThemeData lightTheme(BuildContext context){
    return ThemeData(
        brightness: Brightness.light,
        primarySwatch: graphite,
        scaffoldBackgroundColor: white,
        accentColor: graphite,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: white,
          iconTheme: Theme.of(context).iconTheme,
          textTheme: TextTheme(
            headline6: Theme.of(context).textTheme.headline6,
          ),
        ),
        iconTheme: IconThemeData(
          size: 30,
          color: graphite,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
          ),
          padding: MaterialStateProperty.all(
              EdgeInsets.fromLTRB(30, 15, 30, 15)
          ),
          side: MaterialStateProperty.all(
              BorderSide(width: 2, color: graphite)
          ),
        )),
        textTheme: TextTheme(
          subtitle1: TextStyle(
            fontSize: 25,
          ),
          button: TextStyle(
            fontSize: 20,
          ),
        )
    );
  }
}