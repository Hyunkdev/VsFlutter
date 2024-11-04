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

      // 각 포켓몬의 한글 이름을 가져오기 위한 비동기 호출
      List<PokemonModel> pokemonList = await Future.wait(pokemondata
          .asMap()
          .entries
          .map<Future<PokemonModel>>((element) async {
        final id = element.key + 1;

        // 스페시즈 정보를 요청하여 한글 이름 가져오기
        final koreanName = await getKoreanName(id);
        final species = await getspecies(id);

        // 포켓몬 모델 생성
        return PokemonModel.fromJson({
          'id': id,
          'name': koreanName ?? element.value['name'], // 한글 이름이 없으면 영어 이름 사용
          'species': species,
          'front_default':
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
        });
      }));

      return pokemonList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<String?> getKoreanName(int id) async {
    final response = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$id/"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // names 배열에서 언어가 'ko'인 항목 찾기
      for (var name in data['names']) {
        if (name['language']['name'] == 'ko') {
          return name['name']; // 한글 이름 반환
        }
      }
    } else {
      throw Exception('Failed to load Korean name');
    }
    return null; // 한글 이름이 없을 경우 null 반환
  }

  static Future<String?> getspecies(int id) async {
    final response = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$id"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (var kosp in data['flavor_text_entries']) {
        if (kosp['language']['name'] == 'ko') {
          return kosp['flavor_text'];
        }
      }
    } else {
      throw Exception('Failed to load Korean name');
    }
    return null; // 한글 이름이 없을 경우 null 반환
  }
}
