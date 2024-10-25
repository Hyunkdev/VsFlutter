class Summoner {
  final String id, accountId, profileIconId, summonerLevel;

  Summoner.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        accountId = json['accountId'],
        profileIconId = json['profileIconId'],
        summonerLevel = json['summonerLevel'];
}
