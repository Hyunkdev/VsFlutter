class PokemonModel {
  final int id;
  final String name, front_default;
  final String species;
  final String color;
  final List<PokemonType> types;

  PokemonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        species = json['species'],
        front_default = json['front_default'],
        color = json['color'],
        types = (json['types'] as List)
            .map((typeJson) => PokemonType.fromJson(typeJson))
            .toList();
}

class PokemonType {
  final String name;

  PokemonType.fromJson(String json) : name = json;
}
