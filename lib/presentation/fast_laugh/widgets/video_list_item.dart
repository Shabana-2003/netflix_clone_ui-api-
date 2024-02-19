import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/colors/colors.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/model/movies/movie/movie.dart';


class VideoListItem extends StatelessWidget {
  final int index;
  final Movie movie;
  const VideoListItem({super.key, required this.index,required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                     '$imagePath${movie.posterPath!}',
                    ),
                    fit: BoxFit.cover))),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,vertical: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
          
                //left side
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black.withOpacity(0.6),
                  child: IconButton(onPressed: () {},
                   icon: Icon(Icons.volume_off,
                   color: kwhiteColor,
                   size: 20,))),
          
                //right side
          const  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.themoviedb.org/t/p/w500_and_h282_face/ucFj56P5fXnutVG2HWyDTIQLwVX.jpg'),
                        radius: 29,
                      ),
                    ),
                    VideoActionsWidget(icon: Icons.emoji_emotions, title:"LOL"),
            
                    VideoActionsWidget(icon: Icons.add, title: "My List"),
           
                    VideoActionsWidget(icon: Icons.share, title: "Share"),
             
                    VideoActionsWidget(icon: Icons.play_arrow, title: "Play",),
           
                  ],
                )  
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,
          color: Colors.white,
          size: 30,
          ),
          Text(
        title,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 12,
          ),)
        ],
      ),
    );
  }
}
