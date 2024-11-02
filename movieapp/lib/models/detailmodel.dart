class Detailmodel {
  final String overview, poster, title;
  final List<Genre> genre;
  final bool adult;
  final double vote;
  final int runtime;

  Detailmodel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        genre = (json['genres'] as List)
            .map((genre) => Genre.fromJson(genre))
            .toList(),
        overview = json['overview'],
        poster = json['poster_path'],
        vote = json['vote_average'],
        runtime = json['runtime'],
        title = json['title'];

  String get fullposter => 'https://image.tmdb.org/t/p/w500$poster';
}

class Genre {
  final int id;
  final String name;

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
