import 'package:flutter/material.dart';
import 'package:riotsearch/models/summoner.dart';
import 'package:riotsearch/screens/result_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController riotIdController = TextEditingController();
  Future<Summoner>? summoner;

  final _formKey = GlobalKey<FormState>(); // 폼 상태 관리 키
  // 유효성 검사 함수
  String? validateRiotId(String? value) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9가-힣_-]{3,16}#[a-zA-Z0-9]+$');
    if (value == null || value.isEmpty) {
      return '플레이어 이름과 태그를 입력하세요.';
    } else if (!regex.hasMatch(value)) {
      return '이름은 3~16자이며, 형식은 "소환사 이름+#태그"여야 합니다.';
    }
    return null;
  }

  void _performSearch() {
    String riotId = riotIdController.text;
    print('Searching for: $riotId');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(riotId: riotId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text('검색하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 218, 190),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: riotIdController,
                      decoration: const InputDecoration(
                        hintText: '  소환사 닉네임 + 태그',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _performSearch,
                    icon: const Icon(Icons.search_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
