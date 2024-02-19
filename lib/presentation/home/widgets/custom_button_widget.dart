import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.icon,required this.title,  this.iconSize=30,this.textSize=11
  });

  final IconData icon;
  final String title; 
  final double iconSize;
  final double textSize;



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        Text(
        title,
          style: TextStyle(
              fontSize: textSize, 
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
