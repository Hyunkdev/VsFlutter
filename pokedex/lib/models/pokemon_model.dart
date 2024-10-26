class PokemonModel {
  final int id;
  final String name, front_default;

  PokemonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        front_default = json['front_default'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'front_default': front_default,
      };
}
