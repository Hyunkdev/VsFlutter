import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirsty/provider/bottom_nav_provider.dart';
import 'package:thirsty/provider/countprovider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  late Countprovider _countprovider;
  late BottomNavProvider _bottomNavProvider;

  Widget _bottomNavigationBar() {
    return Consumer<BottomNavProvider>(
      builder: (context, provider, widget) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark_rounded),
                label: 'Collections'),
          ],
          currentIndex: _bottomNavProvider.currentPage,
          selectedItemColor: Colors.blueAccent,
          onTap: (index) {
            _bottomNavProvider.updateCurrentPage(index);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    _countprovider = Provider.of<Countprovider>(context, listen: false);
    _bottomNavProvider = Provider.of<BottomNavProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 155, 255),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Consumer<Countprovider>(
                builder: (context, provider, child) {
                  return Text(
                    provider.check.toString() == 'true'
                        ? '휴.. 살것같군..'
                        : '목말라..',
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 60,
              ),
              Consumer<Countprovider>(
                builder: (context, provider, child) {
                  return InkWell(
                    onTap: () {
                      _countprovider.add();
                    },
                    //<a href="https://www.flaticon.com/kr/free-icons/-" title="물기 없는 아이콘">물기 없는 아이콘 제작자: amonrat rungreangfangsai - Flaticon</a>
                    child: Image.asset(
                      provider.check.toString() == 'false'
                          ? 'assets/thirsty.png'
                          : 'assets/no_thirsty.png',
                      scale: 1.4,
                    ),
                  );
                },
              ),
              Consumer<Countprovider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      Text(
                        provider.count.toString(),
                      ),
                      Text('남은 횟수 : ${provider.grade.toString()} / 3'),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
