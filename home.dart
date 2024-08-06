import 'package:flutter/material.dart';
import 'components/category_card.dart';
import 'components/post_card.dart';
import 'components/restaurant_card.dart';
import 'components/theme_button.dart';
import 'components/collor_button.dart';
import 'constants.dart';
import 'models/food_category.dart';
import 'models/post.dart';
import 'models/restaurant.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
  });
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //tab will be used to keep track of the curent tab the user is on
  int tab = 0;

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Category',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Post',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Restaurant',
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      //Center widget ensures the card widget is centered on the screen
      Center(
        child: ConstrainedBox(
          //constraints here = Applies a maximum width of 300 pixels to the card widget
          constraints: const BoxConstraints(maxWidth: 300),
          child: CategoryCard(
            category: categories[0],
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PostCard(post: posts[0]),
        ),
      ),
      //Center widget ensures the card widget is centered on the screen
      Center(
        child: ConstrainedBox(
          //Applies a maximum width of 400 pixels to the card widget
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          //Set RestaurantLandscapeCard widget as the child, and pass the first mock restaurant to be displayed
          child: RestaurantCard(
            restaurant: restaurants[0],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          CollorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected,
          ),
        ],
      ),
      //IndexedStack stacks and displays one widget from pages based on the tab index, preserving the state of all widgets in the stack
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      //Assigns NavigationBar to bottomNavigationBar
      bottomNavigationBar: NavigationBar(
        //Sets the active tab using selectedIndex
        selectedIndex: tab,
        //Updates the active tab on user selection
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        //Defines the list of tabs with appBarDestinations
        destinations: appBarDestinations,
      ),
    );
  }
}
