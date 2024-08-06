import 'package:flutter/material.dart';

import '../constants.dart';

class CollorButton extends StatelessWidget {
  //Initializes ColorButton with the required callback and color.
  const CollorButton({
    required this.changeColor,
    required this.colorSelected,
    super.key,
  });

//Property changeColor is a callback to handle the color selection, and colorSelected is the currently selected color
  final void Function(int) changeColor;
  final ColorSelection colorSelected;

  @override
  Widget build(BuildContext context) {
    //Creates a button that displays a menu
    return PopupMenuButton(
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      //Applies rounded corners to the popup menu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      //Generates the menu items
      itemBuilder: (context) {
        //Creates a list of color options from ColorSelection
        return List.generate(ColorSelection.values.length, (index) {
          final currentColor = ColorSelection.values[index];
          //Configures each menu item with an icon and text
          return PopupMenuItem(
            value: index,
            enabled: currentColor != colorSelected,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.opacity_outlined,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    currentColor.label,
                  ),
                ),
              ],
            ),
          );
        });
      },
      //Calls changeColor when an item is selected
      onSelected: changeColor,
    );
  }
}
