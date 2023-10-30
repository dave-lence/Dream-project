import 'package:flutter/material.dart';
import 'package:forms_tutorial/navigators/bottom_nav_bar.dart';
import './home_screen.dart';
import './profile_screen.dart';
import './search_screen.dart';

class ListingsScreen extends StatefulWidget {
  const ListingsScreen({super.key});

  @override
  State<ListingsScreen> createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Listings'),
        ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: 2,
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
