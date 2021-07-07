import 'package:flutter/material.dart';

Color KprimaryColor = Color(0xFF0DB7C5);
Color KscandColor = Color(0xFF74828C);

ThemeData themeData = ThemeData(
  fontFamily: 'Tajawal',
  primaryColor: KprimaryColor,
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1: headline1,
    headline2: headline2,
    headline3: headline2,
    headline4: headline2,
    headline5: headline5,
    headline6: headline6,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
  ),
  buttonTheme: ButtonThemeData(
    minWidth: double.infinity
  )
);




TextStyle headline1 = TextStyle(
  fontSize: 22,
  color: KprimaryColor,
);

TextStyle headline2 = TextStyle(
  fontSize: 18,
  color: KprimaryColor,
  fontWeight: FontWeight.w700,
);

TextStyle headline3 = TextStyle(
  fontSize: 26,
  color: Colors.white,
  fontFamily: 'BubbleBobble',
);

TextStyle headline4 = TextStyle(
    fontSize: 16,
    color: Colors.white,
   
    fontWeight: FontWeight.bold);

TextStyle headline5 = TextStyle(
  fontSize: 15,
  color: KprimaryColor,
  fontFamily: 'BubbleBobble',
);

TextStyle headline6 = TextStyle(
  fontSize: 36,
  color: KprimaryColor,
  fontFamily: 'BubbleBobble',
);

TextStyle subtitle1 = TextStyle(
  fontSize: 16,
  color: KscandColor,
);

TextStyle subtitle2 = TextStyle(
  fontSize: 16,
  color: KscandColor,
);

BorderRadius borderRadius = BorderRadius.only(
  bottomLeft: Radius.circular(25),
  bottomRight: Radius.circular(25),
);
