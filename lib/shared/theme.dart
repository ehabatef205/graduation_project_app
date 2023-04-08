import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(color: colorButton),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        minimumSize: const Size(
          double.infinity,
          55,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[400],
      thickness: 1,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black,),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[100],
    ),
  );

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkColor,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(color: colorButton),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        minimumSize: const Size(
          double.infinity,
          55,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      endIndent: 15,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white,),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[800],
    ),
  );

  ThemeData _themeData = ThemeData();

  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData().then((bool? value) {
      bool themeMode = value ?? true;
      if (themeMode) {
        _themeData = darkTheme;
      } else {
        _themeData = lightTheme;
      }
      notifyListeners();
    });
  }

  Future<bool> readData() {
    return StorageManager.readData();
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData(true);
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData(false);
    notifyListeners();
  }
}

class StorageManager {
  static void saveData(bool value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("isDark", value);
  }

  static Future<bool> readData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    dynamic obj = sharedPreferences.getBool("isDark") ?? true;
    return obj;
  }

  static Future<bool> deleteData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.remove("isDark");
  }
}
