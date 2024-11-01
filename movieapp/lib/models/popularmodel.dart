class Popularmodel {
  final String id, backdrop_path;

  Popularmodel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        backdrop_path = json['backdrop_path'];
}
