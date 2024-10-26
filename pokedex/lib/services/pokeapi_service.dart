import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';

// class PokeapiService {
//   static Future<http.Response> getPokemon() => http.get(
//         Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'),
//       );
// }

// void getPokemonFrom() async {
//   PokeapiService.getPokemon().then((response) {
//     List<Map<String, dynamic>> data =
//         List.from(jsonDecode(response.body)['results']);
//     if(response.statusCode == 200)
//   });
// }

class PokeapiService {
  static Future<PokemonModel> getPokemon() async {
    final baseUrl = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151');

    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> pokemonData = jsonDecode(response.body)['result'];

      return PokemonModel.fromJson(pokemonData);
    } else {
      throw Exception('Failed to load pokemonData');
    }
  }
}
