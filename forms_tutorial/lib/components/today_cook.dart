import 'package:flutter/material.dart';

class TodayCookCard extends StatelessWidget {
  const TodayCookCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5, 5), // Shadow position
            blurRadius: 6, // Spread of the shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/food-1.jpg', // Replace with your image URL
                  width: 330,
                  height: 200, // Set the image height as needed
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10, // Adjust the position as needed
                left: 10, // Adjust the position as needed
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent.shade100),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '4.9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Creamy Funghi Risisito",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Healthy - Vegetarian - Lunch",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent.shade100),
                  child: const Text(
                    'Cooking Now',
                    style:
                        TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
