
import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_ui_app/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: "Top 10 TV Shows In India Today"),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ValueListenableBuilder(
              valueListenable: top10TvShowsInIndiaTodayListNotifeir,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount:
                        top10TvShowsInIndiaTodayListNotifeir.value.isNotEmpty
                            ? 10
                            : top10TvShowsInIndiaTodayListNotifeir.value.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = value[index];
                      return NumberCard(index: index+1, movie: data);
                    });
              }),
        )
      ],
    );
  }
}
