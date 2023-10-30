import 'package:flutter/material.dart';
//import 'package:forms_tutorial/screens/screens.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  final int currentIndex;
  final Function(int) onTabTapped;

  //int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 30,
      items: _bottomNavigationBarItems,
      currentIndex: currentIndex,
      onTap: onTabTapped,
      selectedItemColor:
          Colors.black, // Color of the selected item's text and icon
      unselectedItemColor:
          Colors.grey, // Color of the unselected items' text and icon
      showUnselectedLabels: true, // Show text labels for unselected items
      type: BottomNavigationBarType
          .fixed, // To make sure the labels are always visible
    );
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'Listings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  /// on tap to swtch screens
  // void _onTabTapped(int index) {
  //   //  function to switch screens
  //   //  Use Navigator to navigate to the selected screen
  //   if (index == 0) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else if (index == 1) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => SearchScreen()));
  //   } else if (index == 2) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => ListingsScreen()));
  //   } else if (index == 3) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
  //   }

  //  // call the state within the tapp function
  //   setState(() {
  //     _currentIndex = index;
  //
  // });
}
