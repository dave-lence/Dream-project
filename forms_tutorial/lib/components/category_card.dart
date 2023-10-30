import 'package:flutter/material.dart';

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({
    super.key,
    required this.iconName,
    required this.label
  });
  
  final iconName;
  final String label;
   
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20, end: 20 ),
      height: 70,
      width: 70,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
        boxShadow: [BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 5),
            blurRadius: 6
        )]
      ),
      child: Column(
        children: [
          Icon(iconName, color: Colors.grey.shade800,  size: 35),
          Text(label, style: TextStyle(color: Colors.grey.shade800),)
        ],
      ),
    );
  }
}
