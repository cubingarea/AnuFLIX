import 'package:anuflix/const/const_color.dart';
import 'package:anuflix/model/movie_model.dart';
import 'package:anuflix/screen/detailMovieScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.discoverMovies,
  });

  final Future<List<Movie>> discoverMovies;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: discoverMovies,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final movies = snapshot.data!;
          return CarouselSlider.builder(
              itemCount: movies.length < 2 ? movies.length : 5,
              itemBuilder: (context, index, MovieIndex) {
                final movie = movies[index];
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailMovieScreen(movie: movie)));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${movie.title}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1.6,
                autoPlayInterval: const Duration(seconds: 3),
              ));
        });
  }
}
