import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirsty/provider/griditemprovider.dart';

class Collectionswidget extends StatelessWidget {
  final List<int> items = List.generate(5, (index) => index);

  Collectionswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 155, 255),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Consumer<GridItemProvider>(
            builder: (context, provider, child) {
              return GridView.builder(
                shrinkWrap: true, // GridView의 높이를 자식에 맞게 조정
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  provider.selectedItems.contains(items[index]);
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        color: const Color.fromARGB(255, 97, 155, 255),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(
                          provider.images.length > index // 인덱스 범위 체크
                              ? provider.images[index]
                              : 'assets/q.png', // <a href="https://www.flaticon.com/kr/free-icons/" title="물음표 아이콘">물음표 아이콘 제작자: Freepik - Flaticon</a>
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
