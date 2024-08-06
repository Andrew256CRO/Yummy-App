import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    required this.changeThemeMode,
    super.key,
  });

  // changeThemeMode is a callback function that will be passed as a parameter to be called when the user presses a button
  final Function changeThemeMode;

  @override
  Widget build(BuildContext context) {
    //isBright is a Boolean that checks whether the current theme brightness is light.
    final isBright = Theme.of(context).brightness == Brightness.light;

    //An IconButton widget that will display light or dark mode icon based on the isBright Boolean.
    return IconButton(
      icon: isBright
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
      //IconButton, when pressed, toggles the theme brightness by invoking changeThemeMode.
      onPressed: () => changeThemeMode(!isBright),
    );
  }
}
