import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MatchHistoryScreen(),
    );
  }
}

class MatchHistoryScreen extends StatefulWidget {
  const MatchHistoryScreen({super.key});

  @override
  _MatchHistoryScreenState createState() => _MatchHistoryScreenState();
}

class _MatchHistoryScreenState extends State<MatchHistoryScreen> {
  List<dynamic> filteredMatches = [];
  final String summonerName = "동그라밍#KR1"; // 소환사 이름 입력
  final String targetDate = "2023-10-01"; // 조회할 날짜

  @override
  void initState() {
    super.initState();
    fetchMatchHistory();
  }

  Future<void> fetchMatchHistory() async {
    // 1. 소환사 ID 가져오기
    final summonerResponse = await http.get(
      Uri.parse(
          "https://asia.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName"),
      headers: {"X-Riot-Token": "RGAPI-56fe5a55-f77b-4bb1-bc77-2630f961086f"},
    );

    if (summonerResponse.statusCode == 200) {
      final summonerData = json.decode(summonerResponse.body);
      String puuid = summonerData['puuid'];

      // 2. 게임 ID 목록 가져오기
      final matchesResponse = await http.get(
        Uri.parse(
            "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids"),
        headers: {"X-Riot-Token": "RGAPI-56fe5a55-f77b-4bb1-bc77-2630f961086f"},
      );

      if (matchesResponse.statusCode == 200) {
        List<String> matchIds =
            List<String>.from(json.decode(matchesResponse.body));

        // 3. 특정 날짜의 게임 필터링
        int startTimestamp =
            DateTime.parse(targetDate).millisecondsSinceEpoch; // 밀리초로 변환
        for (String matchId in matchIds) {
          final matchDetailResponse = await http.get(
            Uri.parse(
                "https://asia.api.riotgames.com/lol/match/v5/matches/$matchId"),
            headers: {
              "X-Riot-Token": "RGAPI-56fe5a55-f77b-4bb1-bc77-2630f961086f"
            },
          );

          if (matchDetailResponse.statusCode == 200) {
            final matchDetail = json.decode(matchDetailResponse.body);
            int gameTimestamp =
                matchDetail['info']['gameStartTimestamp']; // 밀리초 단위

            // 특정 날짜의 게임만 추가
            if (gameTimestamp >= startTimestamp &&
                gameTimestamp < startTimestamp + 86400000) {
              // 24시간 추가
              filteredMatches.add(matchDetail);
            }
          }
        }
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Match History")),
      body: ListView.builder(
        itemCount: filteredMatches.length,
        itemBuilder: (context, index) {
          final match = filteredMatches[index];
          return ListTile(
            title: Text("Match ID: ${match['id']}"),
            subtitle: Text(
                "Game Start: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(match['info']['gameStartTimestamp']))}"),
          );
        },
      ),
    );
  }
}
