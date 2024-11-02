import 'package:flutter/material.dart';
import 'package:movieapp/models/detailmodel.dart';
import 'package:movieapp/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<Detailmodel> detail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detail = ApiService.getDetailInfo(widget.id);
    setState(() {});
  }

  Widget buildStars(double voteAverage) {
    int starCount = (voteAverage / 2).round().clamp(0, 5);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          size: 30,
          Icons.star_rounded,
          color:
              index < starCount ? Colors.yellow : Colors.grey.withOpacity(.4),
        );
      }),
    );
  }

  String formatRuntime(int runtime) {
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    return '${hours}h ${minutes}min';
  }

  String formatGenres(List<Genre> genres) {
    return genres.map((genre) => genre.name).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Back to List",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: detail,
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {
            final movie = snapshot.data!;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.poster}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildStars(movie.vote),
                      const SizedBox(height: 20),
                      Text(
                        '${formatRuntime(movie.runtime)} | ${formatGenres(movie.genre)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Storyline",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data!.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                      Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber, // 배경 색상 설정
                            foregroundColor: Colors.black, // 텍스트 색상 설정
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero, // 둥글게 처리하지 않음
                            ),
                            minimumSize:
                                const Size(160, 40), // 버튼 크기 설정 (너비, 높이)
                          ),
                          onPressed: () {},
                          child: const Text('Buy ticket'),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Text('ㅎㅇ');
        },
      ),
    );
  }
}
