class Moviemodel {
  final String id;
  final String backdrop_path;
  final String title;

  Moviemodel.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        title = json['title'],
        backdrop_path = json['backdrop_path'];

  String get fullBackdropPath =>
      'https://image.tmdb.org/t/p/w500$backdrop_path';

  @override
  String toString() {
    return 'Moviemodel{id: $id, backdrop_path: $backdrop_path}';
  }
}
