import 'package:flutter/material.dart';
import 'package:netflix_ui_app/presentation/dowloads/widgets/screen_dowloads.dart';
import 'package:netflix_ui_app/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_ui_app/presentation/home/screen_home.dart';
import 'package:netflix_ui_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_ui_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_ui_app/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDowloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //common UI elements like app bars, floating action buttons, and bottom navigation bars.
      body: SafeArea(
        child: ValueListenableBuilder( // Rebuilds the UI whenever the indexChangeNotifier value changes.        
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }
          ),
      ),
      bottomNavigationBar: //Displays the bottom navigation bar at the bottom.
      const BottomNavigationWidget(),
    );
  }
}
