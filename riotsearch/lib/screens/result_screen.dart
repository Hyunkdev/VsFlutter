import 'package:flutter/material.dart';
import 'package:riotsearch/models/summoner.dart';
import 'package:riotsearch/services/api_service.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.riotId});
  final String riotId;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Future<Summoner> sommoner = ApiService.getSummoner(widget.riotId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FutureBuilder(
                      future: sommoner,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  width: 100,
                                  'https://ddragon.leagueoflegends.com/cdn/14.21.1/img/profileicon/${snapshot.data!.profileIconId}.png',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6.0, vertical: 4.0), // 내부 여백
                                decoration: BoxDecoration(
                                  color: Colors.black, // 검은색 배경
                                  borderRadius: BorderRadius.circular(
                                      4.0), // 약간 둥근 모서리 (선택 사항)
                                ),
                                child: Text(
                                  snapshot.data!.summonerLevel,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.riotId.split("#")[0],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '#${widget.riotId.split("#")[1]}',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 1), // 패딩 조정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // 둥근 모서리 반경 설정
                      ),
                      backgroundColor: const Color(0xff5079FF), // 버튼 배경 색상
                    ),
                    onPressed: () {},
                    child: const Text(
                      '전적갱신',
                      style: TextStyle(
                        color: Colors.white, // 텍스트 색상 설정
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
