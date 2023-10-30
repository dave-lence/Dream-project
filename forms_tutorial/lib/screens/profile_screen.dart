import 'package:flutter/material.dart';
import 'package:forms_tutorial/navigators/bottom_nav_bar.dart';
import './listings_screen.dart';
import './home_screen.dart';
import './search_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Profile'),
        ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: 3,
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
