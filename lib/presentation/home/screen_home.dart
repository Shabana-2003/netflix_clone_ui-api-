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
  ////////////////////////////want to learn
  fetchDatas() async {
    trendingNowListNotifeir.value = await Api().getTrendingMovies();
    topRatedListNotifeir.value = await Api().getTopRated();
    upComingListNotifeir.value = await Api().getUpComing();
    top10TvShowsInIndiaTodayListNotifeir.value =await Api().getTop10TvShowsInIndiaToday();
    final random = Random();
    randomIndex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: ((notification) {
                final ScrollDirection direction = notification.direction;
                print(direction);
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              }),
              child: Stack(
                children: [
                  ListView(
                    children:  [
                      FutureBuilder(
                          future: Api().getTrendingMovies(),
                          builder: (context, snapshot) => snapshot.hasData
                              ? BackgroundCard(
                                  image: snapshot.data![randomIndex].posterPath)
                              : const SizedBox(
                                  height: 700,
                                  width: double.infinity,
                                  child: Center(
                                    child: CircularProgressIndicator(),//for loading icon
                                  ),
                                ),
                        ),
                    MainTitleCard(title: ' Released in the past year', listNotifier: trendingNowListNotifeir,),
                             MainTitleCard(title: ' Trending Now', listNotifier: topRatedListNotifeir,),
                     const NumberTitleCard(),
                      MainTitleCard(title: ' Tense Dramas', listNotifier: upComingListNotifeir,),
                      MainTitleCard(title: ' South Indian Cenimas', listNotifier: topRatedListNotifeir,),
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                        duration:const Duration(milliseconds:1000),
                          width: double.infinity,
                          height: 80,
                          color: Colors.black.withOpacity(0.4),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://pngimg.com/d/netflix_PNG8.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  Spacer(),
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
                              ),
                         const     Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "TV Shows",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                        color:
                                            Color.fromARGB(231, 232, 232, 232)),
                                  ),
                                  Text(
                                    "Movies",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                        color:
                                            Color.fromARGB(231, 232, 232, 232)),
                                  ),
                                  Text(
                                    "Categories",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                        color:
                                            Color.fromARGB(231, 232, 232, 232)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : kheight
                ],
              ),
            );
          }),
    );
  }
}
