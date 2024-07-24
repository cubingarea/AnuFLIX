class Movie {
  final String title;
  final String backDropPath;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final String language;
  final List<int> genreId;
  final double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.language,
    required this.genreId,
    required this.releaseDate,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        title: map['title'],
        backDropPath: map['backdrop_path'],
        posterPath: map['poster_path'],
        overview: map['overview'],
        language: map['original_language'],
        releaseDate: map['release_date'],
        genreId: List<int>.from(map['genre_ids']),
        voteAverage: map['vote_average']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backdrop_path': backDropPath,
      'poster_path': posterPath,
      'overview': overview,
      'original_language': language,
      'release_date': releaseDate,
      'genre_ids': genreId,
      'vote_average': voteAverage,
    };
  }
}
