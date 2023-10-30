import 'package:flutter/material.dart';
import 'package:forms_tutorial/navigators/bottom_nav_bar.dart';
import './listings_screen.dart';
import './profile_screen.dart';
import './home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Search'),
        ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: 1,
          onTabTapped: (index) {
            if (index == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            } else if (index == 1) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            } else if (index == 2) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListingsScreen()));
            } else if (index == 3) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          },
        ));
  }
}
