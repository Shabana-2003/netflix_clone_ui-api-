import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        kwidth,
      ],
    );
  }
}
