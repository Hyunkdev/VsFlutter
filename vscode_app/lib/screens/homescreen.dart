import 'dart:async';

import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late int time = 0;
  late int totalSeconds = time;
  bool isRunning = false;

  int rounds = 0;

  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        rounds = rounds + 1;
        isRunning = false;
        totalSeconds = time;
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
    setState(() {
      isRunning = false;
    });
  }

  void restratPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe64d3d),
      appBar: AppBar(
        title: const Text(
          'POMOTIMER',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xffe64d3d),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$totalSeconds',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: IconButton(
                    color: Theme.of(context).cardColor,
                    onPressed: restratPressed,
                    icon: const Icon(Icons.restart_alt_rounded),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      time = 900;
                      totalSeconds = time;
                    });
                  },
                  child: const Text(
                    '15',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      time = 1200;
                      totalSeconds = time;
                    });
                  },
                  child: const Text(
                    '20',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      time = 1500;
                      totalSeconds = time;
                    });
                  },
                  child: const Text(
                    '25',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      time = 1800;
                      totalSeconds = time;
                    });
                  },
                  child: const Text(
                    '30',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      time = 2100;
                      totalSeconds = time;
                    });
                  },
                  child: const Text(
                    '35',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ), //gesture
            Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
