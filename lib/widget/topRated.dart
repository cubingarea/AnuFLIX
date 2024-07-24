import 'package:anuflix/const/const_color.dart';
import 'package:anuflix/model/movie_model.dart';
import 'package:anuflix/screen/detailMovieScreen.dart';
import 'package:flutter/material.dart';

class topRated extends StatelessWidget {
  const topRated({super.key, required this.topRatedMovies});
  final Future<List<Movie>> topRatedMovies;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: topRatedMovies,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final movies = snapshot.data!;
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length < 5 ? movies.length : 5,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final movie = movies[index];
                return Card(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailMovieScreen(movie: movie)));
                        },
                        child: Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original/${movie.posterPath}"),
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
                                "${movie.title}",
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
                      Positioned(
                        child: Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            color: fontColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16.0,
                                color: Colors.amberAccent,
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                  child: Text(
                                      "${movie.voteAverage.toStringAsFixed(1)}")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
