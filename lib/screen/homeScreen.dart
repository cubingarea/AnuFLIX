// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:anuflix/const/api.dart';
import 'package:anuflix/const/const_color.dart';
import 'package:anuflix/model/movie_model.dart';
import 'package:anuflix/widget/carousel_home.dart';
import 'package:anuflix/widget/nowShowing.dart';
import 'package:anuflix/widget/popular.dart';
import 'package:anuflix/widget/topRated.dart';
import 'package:anuflix/widget/upcoming.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late Future<List<Movie>> discoverMovies;
  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topRatedMovies;
  @override
  @override
  void initState() {
    discoverMovies = Api().getDiscover();
    nowPlayingMovies = Api().getNowPlaying();
    popularMovies = Api().getPopular();
    upcomingMovies = Api().getUpcoming();
    topRatedMovies = Api().getTopRated();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang di AnuFLIX",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Mau Nonton Apa Hari Ini?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // carouselWidget(),
                      CarouselWidget(discoverMovies: discoverMovies),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tayang Sekarang",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  "/nowShowingMovie",
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    color: fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      nowShowing(nowPlayingMovies: nowPlayingMovies),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rating Tertinggi",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  "/topRatedMovie",
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    color: fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      topRated(topRatedMovies: topRatedMovies),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Film Populer",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  "/popularMovie",
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    color: fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      popular(popularMovies: popularMovies),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Segera Tayang",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  "/upcomingMovie",
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    color: fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      upComing(
                        upcomingMovies: upcomingMovies,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Copyright 2024@Ugustiningtyas Supriatno©",
                  style: TextStyle(fontSize: 10.0, color: fontColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
