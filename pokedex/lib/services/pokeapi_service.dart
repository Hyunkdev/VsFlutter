import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';

class PokeapiService {
  static Future<List<PokemonModel>> getPokemon() async {
    final response = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=151"));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> pokemondata =
          List.from(jsonDecode(response.body)['results']);

      return pokemondata.asMap().entries.map<PokemonModel>((element) {
        element.value['id'] = element.key + 1;
        element.value['front_default'] =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
        return PokemonModel.fromJson(element.value);
      }).toList();
    } else {
      throw Exception('Fail');
    }
  }
}
