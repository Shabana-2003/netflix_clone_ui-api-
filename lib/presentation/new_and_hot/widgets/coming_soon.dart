import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';
import 'package:netflix_ui_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_ui_app/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({
    super.key,
    required this.movie,
  });
  final Movie movie;
  final DateFormat monthFormatter = DateFormat('MMM');
  final DateFormat dayFormatter = DateFormat('dd');
  final DateFormat dayFormatterDay = DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                monthFormatter
                    .format(DateTime.parse(movie.releaseDate!))
                    .toUpperCase(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dayFormatter.format(DateTime.parse(movie.releaseDate!)),
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                image: movie.posterPath,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width - 170,
                    height: 50,
                    child: Text(
                      '${movie.title}',
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: -4,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                  Spacer(),
                  const Row(
                    children: [
                      CustomButton(
                        icon: Icons.alarm,
                        title: 'Remind me',
                        iconSize: 15,
                        textSize: 9,
                      ),
                      kwidth,
                      CustomButton(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 15,
                        textSize: 9,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              kheight,
              Text(
                  'Coming on ${dayFormatterDay.format(DateTime.parse(movie.releaseDate!))}'),
              kheight,
              Text(
                '${movie.title}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Text(
                '${movie.overview}',
                style:
                    TextStyle(color: Colors.grey, overflow: TextOverflow.fade),
              )
            ],
          ),
        ),
      ],
    );
  }
}
