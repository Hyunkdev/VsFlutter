import 'package:diary/screens/mainScreen.dart';
import 'package:flutter/material.dart';

class Loadscreen extends StatefulWidget {
  const Loadscreen({super.key});

  @override
  State<Loadscreen> createState() => _LoadscreenState();
}

class _LoadscreenState extends State<Loadscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
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
          Expanded(
            child: Center(
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
          ),
        ],
      ),
    );
  }
}
