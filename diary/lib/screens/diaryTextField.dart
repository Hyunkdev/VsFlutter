import 'dart:async';

import 'package:flutter/material.dart';

class DiaryTextField extends StatefulWidget {
  const DiaryTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  State<DiaryTextField> createState() => _DiaryTextFieldState();
}

class _DiaryTextFieldState extends State<DiaryTextField> {
  static const int fifteen = 20;
  int totalSeconds = fifteen;
  bool isRunning = true;

  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = fifteen;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            isRunning ? format(totalSeconds) : '시간 종료 !',
            style: const TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.w400,
              fontSize: 100,
              fontFamily: 'MyCustomFont',
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: onStartPressed,
              icon: const Icon(Icons.play_arrow_rounded),
            ),
            IconButton(
              onPressed: onPausePressed,
              icon: const Icon(Icons.pause_outlined),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown,
            ),
            borderRadius: BorderRadius.circular(
              20,
            ),
            color: const Color.fromARGB(255, 255, 246, 242),
          ),
          height: 480,
          child: TextField(
            style: const TextStyle(
              fontFamily: 'MyCustomFont',
              fontSize: 20,
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: widget._controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8),
            ),
          ),
        ),
      ],
    );
  }
}
