import 'package:anuflix/const/theme.dart';
import 'package:anuflix/model/movie_model.dart';
import 'package:anuflix/screen/detailMovieScreen.dart';
import 'package:anuflix/screen/homeScreen.dart';
import 'package:anuflix/screen/nowShowingMovies.dart';
import 'package:anuflix/screen/onboardingScreen.dart';
import 'package:anuflix/screen/popularMovies.dart';
import 'package:anuflix/screen/topRatedMovies.dart';
import 'package:anuflix/screen/upcomingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnuFLIX',
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const onboardingScreen(),
        '/home': (context) => const homeScreen(),
        '/upcomingMovie': (context) => const upcomingScreen(),
        '/nowShowingMovie': (context) => const NowShowingMovies(),
        '/topRatedMovie': (context) => const topRatedMovies(),
        '/popularMovie': (context) => const popularMovies(),
      },
      // home: onboardingScreen(),
    );
  }
}
