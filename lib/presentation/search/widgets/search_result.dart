import 'package:flutter/material.dart';
import 'package:netflix_ui_app/controller/api/api.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';
import 'package:netflix_ui_app/presentation/search/widgets/title.dart';
import 'package:netflix_ui_app/presentation/widgets/main_card.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.result}) : super(key: key);
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV",),
        kheight,
        Expanded(
          child: FutureBuilder<List<Movie>>(
            future: Api().searchResult(result),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error loading data"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("No data found"),
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemBuilder: (context, index) {
                    var data = snapshot.data![index];
                    return MainCard(
                      movie: data,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
