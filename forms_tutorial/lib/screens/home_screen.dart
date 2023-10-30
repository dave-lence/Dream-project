import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forms_tutorial/components/components.dart';
import 'package:forms_tutorial/navigators/bottom_nav_bar.dart';
import './listings_screen.dart';
import './profile_screen.dart';
import './search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  final _searchController = TextEditingController();

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          title: Row(children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/profile.jpeg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Hello,  ${user.email!.substring(0, 5)}!",
                  style: const TextStyle(
                      color: Colors.black, fontStyle: FontStyle.italic),
                )
              ],
            )
          ]),
          backgroundColor: Colors.grey.shade100,
          toolbarHeight: 70,
          actions: [
            IconButton(
              onPressed: logout,
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),

                // header text
                const Text(
                  'What are we cooking today?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'avenir'),
                ),

                const SizedBox(
                  height: 30,
                ),

                // search box

                HomeSearch(searchController: _searchController),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Recipe of the day',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),

                const TodayCookCard(),

                // catergries
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Category",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.grey.shade500),
                    )
                  ],
                ),

                // category row
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    // catergory card
                    children: <Widget>[
                      CatergoryCard(
                        iconName: (Icons.food_bank),
                        label: 'Burger',
                      ),
                      CatergoryCard(
                        iconName: (Icons.bakery_dining),
                        label: 'Bake',
                      ),
                      CatergoryCard(
                        iconName: (Icons.cake),
                        label: 'Cake',
                      ),
                      CatergoryCard(
                        iconName: (Icons.rice_bowl),
                        label: 'Rice',
                      ),
                      CatergoryCard(
                        iconName: (Icons.cookie),
                        label: 'Cookies',
                      ),
                      CatergoryCard(
                        iconName: (Icons.coffee),
                        label: 'Coffee',
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    // catergory card
                    children: <Widget>[
                      HomeGridCrad(
                        imgPath: 'assets/food-1.jpg',
                        time: '10 min',
                        placeSpecial: 'NewYork Classic',
                        name: 'Cheesecake',
                      ),
                      HomeGridCrad(
                        imgPath: 'assets/food-4.jpg',
                        time: '10 min',
                        placeSpecial: 'NewYork Classic',
                        name: 'Cheesecake',
                      ),
                      HomeGridCrad(
                        imgPath: 'assets/food-2.jpg',
                        time: '10 min',
                        placeSpecial: 'NewYork Classic',
                        name: 'Cheesecake',
                      ),
                      HomeGridCrad(
                        imgPath: 'assets/food-3.jpg',
                        time: '10 min',
                        placeSpecial: 'NewYork Classic',
                        name: 'Cheesecake',
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            )),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: 0,
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
