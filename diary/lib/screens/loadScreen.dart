import 'package:diary/screens/mainScreen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Mainscreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 175, 167),
      // appBar: AppBar(
      //   title: const Text(
      //     '일기쓰기',
      //     style: TextStyle(
      //       fontSize: 24,
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: Colors.brown,
      // ),
      body: Column(
        children: [
          const SizedBox(
            height: 240,
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity, // 공간을 가득 채우도록 설정
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '15분 일기',
                      style: TextStyle(
                        fontFamily: 'MyCustomFont',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 80, // 텍스트 크기 조정
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity, // 공간을 가득 채우도록 설정
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 240,
          ),
        ],
      ),
    );
  }
}
