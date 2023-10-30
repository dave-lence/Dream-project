import 'package:flutter/material.dart';

class ContainerTile extends StatelessWidget {
  const ContainerTile({
    super.key,
    required this.imgPath,
    required this.onTap
  });
final String imgPath;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey, // Shadow color
                offset: Offset(0, 4), // Offset of the shadow
                blurRadius: 8, // Spread of the shadow
              ),
            ],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
        child: Image.asset(
          imgPath,
          width: 40,
        ),
      ),
    );
  }
}
