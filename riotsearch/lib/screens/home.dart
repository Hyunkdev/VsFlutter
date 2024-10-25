import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riotsearch/models/summoner.dart';
import 'package:riotsearch/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final riotIdController = TextEditingController();
  Future<Summoner>? summoner; // nullable로 변경

  void searchSummoner() {
    final inputValue = riotIdController.text;
    setState(() {
      summoner = ApiService.getSummoner(inputValue); // API 호출
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API 사용',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<Summoner>(
            future: summoner,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // 로딩 인디케이터
              } else if (snapshot.hasError) {
                print('error');
                return Text('오류 발생: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Text(snapshot.data!.profileIconId); // 소환사 ID 표시
              } else {
                return const Text('소환사 정보를 입력하세요.');
              }
            },
          ),
          TextField(
            controller: riotIdController,
            decoration: const InputDecoration(
              hintText: '소환사 이름 입력',
            ),
          ),
          IconButton(
            onPressed: searchSummoner, // 검색 메서드 호출
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
