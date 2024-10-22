import 'package:flutter/material.dart';

class Diaryscreen extends StatefulWidget {
  const Diaryscreen({super.key, required this.selectedDay});

  final DateTime selectedDay;

  @override
  State<Diaryscreen> createState() => _DiaryscreenState();
}

class _DiaryscreenState extends State<Diaryscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '선택된 날짜: ${widget.selectedDay.month} / ${widget.selectedDay.day}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 이전 화면으로 돌아가기
              Navigator.pop(context);
            },
            child: const Text('돌아가기'),
          ),
        ],
      ),
    );
  }
}
