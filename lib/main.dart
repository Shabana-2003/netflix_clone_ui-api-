import 'package:flutter/material.dart';
import 'package:netflix_ui_app/core/colors/colors.dart';
import 'package:netflix_ui_app/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
       // primarySwatch: Colors.blue,
        scaffoldBackgroundColor: backgroundColor,//showing background black
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: const TextTheme(
            //bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)// showing text color white
            ),
        useMaterial3: true,//provide a more modern and flexible approach to building UIs for Android, iOS
      ),
      home: ScreenMainPage(),
    );
  }
}
