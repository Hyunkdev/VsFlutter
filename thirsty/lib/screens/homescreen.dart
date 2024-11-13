import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Container(
                //<a href="https://www.flaticon.com/kr/free-icons/-" title="물기 없는 아이콘">물기 없는 아이콘 제작자: amonrat rungreangfangsai - Flaticon</a>
                child: Image.asset(
                  'assets/thirsty.png',
                  scale: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
