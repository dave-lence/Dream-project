import 'package:flutter/material.dart';

class HomeGridCrad extends StatelessWidget {
  HomeGridCrad(
      {super.key,
      required this.imgPath,
      required this.time,
      required this.placeSpecial,
      required this.name,
    });

  String imgPath;
  String time;
  String placeSpecial;
  String name;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 10, right: 15, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(2, 5), blurRadius: 6)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              Text(
                time,
                style: TextStyle(color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                placeSpecial,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}


