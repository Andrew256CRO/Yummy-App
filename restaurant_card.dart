import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    required this.restaurant,
    super.key,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            //borderRadius rounds the top corners with an 8.0 unit radius
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            //AspectRatio displays an image with a 2:1 width-to-height ratio. The image scales to fit its container
            child: AspectRatio(
              aspectRatio: 2,
              child: Image.asset(
                restaurant.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            //title shows the restaurant’s name with a specific style
            title: Text(
              restaurant.name,
              style: textTheme.titleSmall,
            ),
            //subtitle displays the restaurant’s attributes, truncated if more than one line
            subtitle: Text(
              restaurant.attributes,
              maxLines: 1,
              style: textTheme.bodySmall,
            ),
            //onTap prints the restaurant’s name to the console when tapped
            onTap: () {
              //ignore: avoid print
              print('Tap on ${restaurant.name}');
            },
          ),
        ],
      ),
    );
  }
}
