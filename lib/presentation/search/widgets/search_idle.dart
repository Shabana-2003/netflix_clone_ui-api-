import 'package:flutter/material.dart';
import 'package:netflix_ui_app/controller/api/api.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/presentation/search/widgets/title.dart';
import 'package:netflix_ui_app/presentation/search/widgets/top_search.dart';


class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SearchTextTitle(title:"Top Searches",),
        kheight,
       Expanded(
          child: FutureBuilder(
            future: Api().forSearchDara(),
            builder: (context, snapshot) {
              if (snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),////////////
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return TopSearchItemTile(
                        movie: data,
                      );
                    },
                    separatorBuilder: (context, index) => kheight,
                    itemCount: snapshot.data!.length);
              }
            },
          ),
        ),
      ],
    );
  }
}

