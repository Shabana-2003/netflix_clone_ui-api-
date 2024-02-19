import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';
import 'package:netflix_ui_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_ui_app/presentation/widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  const EveryOnesWatchingWidget({
    super.key, required this.movie,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          '${movie.title}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Text(
          '${movie.overview}' ,
          style: TextStyle(color: Colors.grey),
        ),
        kheight50,
        VideoWidget(
          image: movie.posterPath,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButton(
              icon: Icons.add,
              title: 'My List',
              iconSize: 28,
              textSize: 16,
            ),
            kwidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}

const everyonewatchingimg =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/9iRRfMZbnpgHDdKi2lczGGYZXDo.jpg';
