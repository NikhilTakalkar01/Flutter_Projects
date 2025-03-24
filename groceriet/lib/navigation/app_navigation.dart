// import 'package:flutter/material.dart';

// class AppNavigationScreen extends StatefulWidget {
//   const AppNavigationScreen({super.key});

//   @override
//   State<AppNavigationScreen> createState() => _AppNavigationScreenState();
// }

// class _AppNavigationScreenState extends State<AppNavigationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:groceriet/cart/my_cart.dart';
import 'package:groceriet/explore_screen/explore_screen.dart';
import 'package:groceriet/favourite_screen/favourite_screen.dart';
import 'package:groceriet/home_screen/home_screen.dart';

// import 'package:super_app_main_version/view/dashboard_screen/dasnboard_screen.dart';
// import 'package:super_app_main_version/view/items_screen/items_screen.dart';
// import 'package:super_app_main_version/view/parties_screen/parties_screen.dart';
// import 'package:super_app_main_version/view/profile_screen.dart/profile_screen.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({super.key});

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  int _currentIndex = 0;
  final int _selectedIndex = 0; // Current index of the selected button
  final PageController _pageController =
      PageController(); // Page controller to manage PageView

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the selected index
    });
    _pageController.jumpToPage(index); // Jump to the selected page
  }

  @override
  Widget build(BuildContext context) {
    // final appLocal = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController, // Connect the PageController
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        children: [
          const HomeScreen(),
          const ExploreScreen(),
          MyCart(),
          FavouriteScreen()
          //  CartPage(),
          //  FavouritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(83, 177, 117, 1),
        unselectedItemColor: Color.fromRGBO(24, 23, 37, 1),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
