import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_ui_app/controller/api/api.dart';
import 'package:netflix_ui_app/core/colors/colors.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/presentation/widgets/app_bar_widgets.dart';

class ScreenDowloads extends StatelessWidget {
  ScreenDowloads({super.key});

  final _widgetList =[
          const SizedBox(
            height: 15,
          ),
          const _SmartDowloads(),
          Section2(),
         const Section3(),
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Dowloads",
          )),
      body:ListView.separated(
       itemBuilder: (ctx,index)=>_widgetList[index],
       separatorBuilder: (ctx,index)=>SizedBox(height: 20,) ,
       itemCount: _widgetList.length,
       )

    );
  }
}

class Section2 extends StatelessWidget {
   Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            'Introduction Dowloads for you',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kwhiteColor,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(17.0),
          child: Text(
            "we will dowload a personalised selection of movies and shows for you,so there is always something to watch on your device",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(
                  255, 162, 163, 164), // Change text color to blue
            ),
          ),
        ),
         FutureBuilder<List<String?>>(
          future: Api().getDownloadImageUrls(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: size.width * 0.395,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: size.width * 0.395,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            } else {
          return SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
               DowloadsImageWidget(
                  imageList: snapshot.data![0],
                  margin: EdgeInsets.only(left: 140, bottom: 50, top: 40),
                  angle: 25,
                  size: Size(size.width * 0.4, size.width * 0.58)),
               DowloadsImageWidget(
                imageList: snapshot.data![1],
                margin: EdgeInsets.only(right: 140, bottom: 50, top: 30),
                angle: -25,
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              DowloadsImageWidget(
                  imageList: snapshot.data![2],
                  margin: EdgeInsets.only(bottom: 10, top: 30),
                  size: Size(size.width * 0.45, size.width * 0.65)),
    
                  ],
                ),
              );
            }
          },
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
                color: kButtonColorBlue,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Set up",
                    style: TextStyle(
                        color: kwhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
          MaterialButton(
            color: kButtonColorWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "See what you can dowload",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
      ],
    );
  }
}

class _SmartDowloads extends StatelessWidget {
  const _SmartDowloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart Dowloads')
      ],
    );
  }
}

class DowloadsImageWidget extends StatelessWidget {
  const DowloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final String? imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                 fit: BoxFit.cover,
                image: NetworkImage("$imagePath$imageList"))),
        ),
      ),
    );
  }
}
