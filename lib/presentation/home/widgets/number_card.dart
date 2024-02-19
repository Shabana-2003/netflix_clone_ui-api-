import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index,required this.movie});
  final int index;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 130,
              height: 260,
             
                decoration: BoxDecoration(
                  borderRadius: kradius,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('$imagePath${movie.posterPath}'))),
            ),
          ],
        ),
        StrokeText(
          text: "${index}",
          textStyle: TextStyle(
              fontSize: 150,
              decoration: TextDecoration.none,
              color: const Color.fromARGB(255, 0, 0, 0)),
          strokeColor: const Color.fromARGB(255, 255, 255, 255),
          strokeWidth: 3,
        ),
      ],
    );
  }
}
