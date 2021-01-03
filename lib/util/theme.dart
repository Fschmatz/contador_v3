import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

  //CLARO
  ThemeData light = ThemeData(

    brightness: Brightness.light,
    primaryColor: Color(0xFF37474f),
    accentColor: Colors.black,
    scaffoldBackgroundColor: Color(0xFFFAFAFF),

    cardTheme: CardTheme(
      color: Color(0xFFF8F8FB), //0xFFFAFAFC
    ),

    dialogTheme: DialogTheme(
      backgroundColor: Color(0xFFFAFAFF),
    ),

    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF282828)))
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFAFAFF),
      selectedLabelStyle: TextStyle(color: Colors.black),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[400],
      showUnselectedLabels: true,
    ),  );



  //ESCURO
  ThemeData dark = ThemeData(

    brightness: Brightness.dark,
    primaryColor: Color(0xFF292b2f),
    accentColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFF151515),

    cardTheme: CardTheme(
        color: Color(0xFF262626)
    ),

    dialogTheme: DialogTheme(
        backgroundColor: Color(0xFF202020)
    ),

    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF282828)))
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF151515),
      selectedLabelStyle: TextStyle(color: Colors.white),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[800],
      showUnselectedLabels: true,
    ),
  );


class ThemeNotifier extends ChangeNotifier{

  final String key = 'valorTema';
  SharedPreferences prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier(){
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme(){
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async{
    if(prefs == null){
      prefs = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async{
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async{
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}


