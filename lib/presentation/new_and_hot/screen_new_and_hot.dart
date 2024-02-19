import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix_ui_app/presentation/new_and_hot/widgets/everyones_watching.dart';


class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: Text(
              'New & Hot',
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.bold, color: kwhite),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kwidth
            ],
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0.5,
                labelColor: kblackcolor,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelColor: kwhite,
                indicator: BoxDecoration(
                  color: kwhite,
                  borderRadius: kradius30,
                ),
                tabs: const [
                  Tab(
                    text: '🍿Coming Soon',
                  ),
                  Tab(
                    text: "👀Everyone's Watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(context),
          _buildEveryoneWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: upComingListNotifeir,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              var data = value[index];
              return ComingSoonWidget(
                movie: data,
              );
            },
          );
        });
  }

  _buildEveryoneWatching() {
    return ValueListenableBuilder(
        valueListenable: topRatedListNotifeir,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              var data = value[index];
              return EveryOnesWatchingWidget(
                movie: data,
              );
            }
                );
        });
  }
}
