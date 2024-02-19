import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_ui_app/controller/api/api.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/presentation/home/widgets/background_card.dart';
import 'package:netflix_ui_app/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_ui_app/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
int randomIndex = 0;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  fetchDatas() async {
    trendingNowListNotifeir.value = await Api().getTrendingMovies();
    topRatedListNotifeir.value = await Api().getTopRated();
    upComingListNotifeir.value = await Api().getUpComing();
    top10TvShowsInIndiaTodayListNotifeir.value =
        await Api().getTop10TvShowsInIndiaToday();
    final random = Random();
    randomIndex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas();
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        FutureBuilder(
                          future: Api().getTrendingMovies(),
                          builder: (context, snapshot) => snapshot.hasData
                              ? BackgroundCard(
                                  image: snapshot.data![randomIndex].posterPath)
                              : const SizedBox(
                                  height: 700,
                                  width: double.infinity,
                                  child: Center(
                                    child:
                                        CircularProgressIndicator(), //for loading icon
                                  ),
                                ),
                        ),
                        MainTitleCard(
                          title: ' Released in the past year',
                          listNotifier: trendingNowListNotifeir,
                        ),
                        kheight,
                        MainTitleCard(
                          title: ' Trending Now',
                          listNotifier: topRatedListNotifeir,
                        ),
                        kheight,
                        NumberTitleCard(),
                        kheight,
                        MainTitleCard(
                          title: ' Tense Dramas',
                          listNotifier: upComingListNotifeir,
                        ),
                        kheight,
                        MainTitleCard(
                          title: ' South Indian Cenimas',
                          listNotifier: topRatedListNotifeir,
                        ),
                        kheight
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(microseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://pngimg.com/d/netflix_PNG8.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                        size: 35,
                                    ),
                                    kwidth,
                                    Image.network(
                                      'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSc0y4Qg5WfxMY1cP1n31iE38DMMuZQXnMxpj1pQ9me-6GRu64V',
                                      width: 30,
                                      height: 30,
                                    ),
                                    kwidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'TV Shows',
                                      style: kHometitleText,
                                    ),
                                    Text(
                                      'Movies',
                                      style: kHometitleText,
                                    ),
                                    Text(
                                      'Categories',
                                      style: kHometitleText,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight
                  ],
                ),
              );
            }));
  }
}
