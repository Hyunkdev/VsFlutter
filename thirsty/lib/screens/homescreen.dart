import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirsty/provider/countprovider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  late Countprovider _countprovider;

  @override
  Widget build(BuildContext context) {
    _countprovider = Provider.of<Countprovider>(context);
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
              const Text(
                '목말라..',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  _countprovider.add();
                },
                //<a href="https://www.flaticon.com/kr/free-icons/-" title="물기 없는 아이콘">물기 없는 아이콘 제작자: amonrat rungreangfangsai - Flaticon</a>
                child: Image.asset(
                  'assets/thirsty.png',
                  scale: 1.4,
                ),
              ),
              Text(
                Provider.of<Countprovider>(context).count.toString(),
              ),
              Text(
                'Grade : ${Provider.of<Countprovider>(context).grade.toString()}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
