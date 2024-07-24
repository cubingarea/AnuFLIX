import 'package:anuflix/const/api.dart';
import 'package:anuflix/const/const_color.dart';
import 'package:anuflix/model/genre_model.dart';
import 'package:anuflix/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailMovieScreen extends StatefulWidget {
  final Movie movie;

  const DetailMovieScreen({super.key, required this.movie});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  late Future<List<Genre>> genres;

  @override
  void initState() {
    super.initState();
    genres = Api().getGenre();
  }

  // Retrieve genre names from a list of genre IDs
  String getGenreNames(List<int> genreIds, List<Genre> genres) {
    List<String> genreNames = [];
    for (var id in genreIds) {
      final genre = genres.firstWhere((g) => g.id == id);
      if (genre != null) {
        genreNames.add(genre.name);
      }
    }
    return genreNames.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<Genre>>(
            future: genres,
            builder: (context, genreSnapshot) {
              if (genreSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                final genreList = genreSnapshot.data!;
                final genreNames =
                    getGenreNames(widget.movie.genreId, genreList);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original/${widget.movie.backDropPath}",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.3), // Warna bayangan
                                        spreadRadius: 5, // Jangkauan bayangan
                                        blurRadius: 9, // Buramnya bayangan
                                        offset: Offset(0,
                                            3), // Geser bayangan (horizontal, vertical)
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 24.0,
                                    color: fontColor,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original/${widget.movie.posterPath}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.movie.title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: fontColor,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  "Genre: $genreNames",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: fontColor,
                                  ),
                                ),
                                Text(
                                  "Rating: ${widget.movie.voteAverage.toStringAsFixed(1)}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: fontColor,
                                  ),
                                ),
                                Text(
                                  "Tanggal Rilis: ${widget.movie.releaseDate}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: fontColor,
                                  ),
                                ),
                                Text(
                                  "Bahasa: ${widget.movie.language}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: fontColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sinopsis:",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: fontColor),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            widget.movie.overview,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: fontColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
