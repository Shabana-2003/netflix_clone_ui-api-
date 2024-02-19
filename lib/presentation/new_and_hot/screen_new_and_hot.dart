import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui_app/controller/api/api.dart';
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
                  fontSize: 20, fontWeight: FontWeight.bold, color: kwhite),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kwidth,
              Image.network(
                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSc0y4Qg5WfxMY1cP1n31iE38DMMuZQXnMxpj1pQ9me-6GRu64V',
                width: 30,
                height: 30,
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
  return FutureBuilder(
    future: Api().forSearchDara(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var data = snapshot.data![index];
            return ComingSoonWidget(
              movie: data,
            );
          },
        );
      }
    },
  );


  }

  _buildEveryoneWatching() {
   return FutureBuilder(
    future: Api().forSearchDara(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var data = snapshot.data![index];
            return EveryOnesWatchingWidget(
              movie: data,
            );
          },
        );
      }
    },
  );
  }
}
