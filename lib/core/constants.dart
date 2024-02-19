import 'package:flutter/material.dart';

import '../../model/movies/movie/movie.dart';

const kwidth = SizedBox(
  width: 10,
);
const kwhite = Colors.white;
final buttoncolorblue = Colors.blueAccent[700];
const buttoncolorWhite = Colors.white;
const kblackcolor = Colors.black;
const kheight = SizedBox(
  height: 10,
);
const kheight20 = SizedBox(
  height: 20,
);
const kheight50 = SizedBox(
  height: 50,
);

//BorderRadius

final BorderRadius kRadious20 = BorderRadius.circular(30);
BorderRadius kradius = BorderRadius.circular(10);
BorderRadius kradius30 = BorderRadius.circular(30);

//iimage

const kMainImage =
    "https://media.themoviedb.org/t/p/w440_and_h660_face/dwIQ7WDCSiIcNdbferTcU7uI0KV.jpg";

//textSTyle

TextStyle kHometitleText =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

    //apikey

    const apiKey = "e96764378f792062b00a5add9e8bde55";

    const imagePath = 'https://image.tmdb.org/t/p/w500';

  //notifiers

  ValueNotifier<List<Movie>> trendingNowListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> topRatedListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> top10TvShowsInIndiaTodayListNotifeir =
    ValueNotifier([]);
ValueNotifier<List<Movie>> upComingListNotifeir = ValueNotifier([]);
ValueNotifier<List<Movie>> searchResultListNotifeir = ValueNotifier([]);
