import 'package:flutter/material.dart';

import '../models/food_category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    super.key,
  });

  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Stack widget allows you to overlay widgets on top of each other
          Stack(
            children: [
              //clips the image with rounded corners at the top(in this case)
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(category.imageUrl),
              ),
              //Position the text “Yummy” on the top-left
              Positioned(
                left: 16,
                top: 16,
                child: Text(
                  'Yummy',
                  style: textTheme.headlineLarge,
                ),
              ),
              //Rotate the text “Smoothies” 90 degrees and place it at the bottom-right
              Positioned(
                bottom: 16,
                right: 16,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Smoothies',
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            //Display the category name with a smaller title style
            title: Text(
              category.name,
              style: textTheme.titleSmall,
            ),
            //Display the number of restaurants in a small body text style
            subtitle: Text(
              '${category.numberOfRestaurants} places',
              style: textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
