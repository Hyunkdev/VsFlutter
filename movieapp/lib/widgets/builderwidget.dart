import 'package:flutter/material.dart';
import 'package:movieapp/models/moviemodel.dart';

class BuilderWidget extends StatelessWidget {
  Future<List<Moviemodel>> future;
  final int width, height;
  final bool check;

  BuilderWidget({
    super.key,
    required this.future,
    required this.check,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Moviemodel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal, // 가로로 스크롤 가능
            child: Column(
              children: [
                Row(
                  children: snapshot.data!.map((future) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16), // 둥글게 만들기
                            child: Image.network(
                              future.fullBackdropPath,
                              width: width.toDouble(),
                              height: height.toDouble(),
                              fit: BoxFit.cover, // 이미지 비율 유지
                            ),
                          ),
                          if (check)
                            SizedBox(
                              width: width.toDouble(),
                              height: 40,
                              child: Text(
                                future.title,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            )
                        ],
                      ),
                    );
                  }).toList(), // map 결과를 리스트로 변환
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('No data found.'));
      },
    );
  }
}
