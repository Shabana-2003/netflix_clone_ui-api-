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
         Image.network(
                                      'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSc0y4Qg5WfxMY1cP1n31iE38DMMuZQXnMxpj1pQ9me-6GRu64V',
                                      width: 30,
                                      height: 30,
                                    ),
        kwidth,
      ],
    );
  }
}
