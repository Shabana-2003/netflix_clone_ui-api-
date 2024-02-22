import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title, required this.listNotifier,
  });
  final String title;
  final ValueNotifier<List<Movie>> listNotifier;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ValueListenableBuilder(
            valueListenable: listNotifier,
            builder: (context, value, _) {   
           return ListView.builder(
                    itemCount: value.length,
                    scrollDirection: Axis.horizontal,//Below the title, a list of movies is displayed horizontally.
                    itemBuilder: (context, index) {
                      var data = value[index];
                      return MainCard(
                        movie: data,
                      );
            } );
            }))
      ],
    );
  }
}
