import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  // 1
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  // TODO: Setup default theme

  // 2
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      //update theme mode based on user selection
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      //update theme color
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    //3
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Home(
          changeTheme: changeThemeMode,
          changeColor: changeColor,
          colorSelected: colorSelected),
    );
  }
}
