import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';


class MainCard extends StatelessWidget {
  const MainCard({
    super.key, required this.movie,
    
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kradius,
          image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("$imagePath${movie.posterPath}"))),
    );
  }
}
