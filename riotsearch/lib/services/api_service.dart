import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riotsearch/models/summoner.dart';

class ApiService {
  static Future<Summoner> getSummoner(String riotId) async {
    List<String> parts = riotId.split("#");
    String riotName = parts[0];
    String tag = parts[1];

    const baseUri =
        'https://asia.api.riotgames.com/riot/account/v1/accounts/by-riot-id';

    String api = 'RGAPI-68817c27-9bca-4b06-8215-8b4f209062e6';

    final url = Uri.parse(
      '$baseUri/$riotName/$tag?api_key=$api',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> userInfo = jsonDecode(response.body);
      final String puuid = userInfo['puuid'] ?? "";

      if (puuid.isNotEmpty) {
        const infoUri =
            'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-puuid';

        final infoUrl = Uri.parse('$infoUri/$puuid?api_key=$api');
        final infoResponse = await http.get(infoUrl);

        if (infoResponse.statusCode == 200) {
          final Map<String, dynamic> profile = jsonDecode(infoResponse.body);
          profile['profileIconId'] = profile['profileIconId'].toString();
          profile['summonerLevel'] = profile['summonerLevel'].toString();

          return Summoner.fromJson(profile);
        } else {
          throw Exception('Failed to load Summoner Profile');
        }
      } else {
        throw Exception('puuid is Empty');
      }
    } else {
      throw Exception('Failed to load puuid');
    }
  }
}
