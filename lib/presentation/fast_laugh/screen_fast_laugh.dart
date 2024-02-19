import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: trendingNowListNotifeir,
                builder: (context, value, _) {
                  return PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: value.length,
                    itemBuilder: (context, index){ 
                       var data = value[index];
                      return VideoListItem(
                        index: index, movie:data,);
                        }
                  );
                })));
  }
}
