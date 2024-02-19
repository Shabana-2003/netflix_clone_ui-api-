import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/colors/colors.dart';
import 'package:netflix_ui_app/core/constants.dart';
import 'package:netflix_ui_app/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key,required this.image});
   final String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage((imagePath + image!)))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomButton(
                  title: "My List",
                  icon: Icons.add_sharp,
                ),
                _playButton(),
                const CustomButton(icon: Icons.info_outline, title: "Info")
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(Color.fromARGB(255, 243, 243, 243)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(4.0), // Adjust the radius as needed
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(80.0, 8.0)),
    ),
    icon: const Icon(
      Icons.play_arrow,
      size: 30,
      color: kBlackColor,
    ),
    label: const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Play",
        style: TextStyle(
            color: kBlackColor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
