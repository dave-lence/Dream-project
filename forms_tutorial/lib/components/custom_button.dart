import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,required this.btnTitle
  });

  final Function()? onTap;
  final String btnTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
            BoxShadow(
              color: Colors.grey, // Shadow color
              offset: Offset(0, 4), // Offset of the shadow
              blurRadius: 8, // Spread of the shadow
            ),
          ],
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Text(
            btnTitle,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
        ),
      ),
    );
  }
}
