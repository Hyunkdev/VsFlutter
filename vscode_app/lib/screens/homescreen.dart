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
  bool isResting = false;

  int rounds = 0;
  int goals = 0;

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
    if (rounds == 4) {
      setState(() {
        rounds = 0;
        goals = goals + 1;
        totalSeconds = 300;
        isResting = true;
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
      isResting = false;
      totalSeconds = time;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(2, 7);
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
            SizedBox(
                height: 160,
                child: isResting
                    ? const Text(
                        '휴식시간',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      )
                    : null),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  format(totalSeconds),
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
            const SizedBox(
              height: 60,
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
                      fontSize: 24,
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
                      fontSize: 24,
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
                      fontSize: 24,
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
                      fontSize: 24,
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
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ), //gesture
            const SizedBox(
              height: 80,
            ),
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
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$rounds / 4',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        '$goals / 12',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' ROUND',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' GOAL    ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
