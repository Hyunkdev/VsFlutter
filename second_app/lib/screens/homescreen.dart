import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    int dayAsInt = today.day;

    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.home,
                  size: 44,
                  color: Colors.white,
                ),
                Icon(
                  Icons.add,
                  size: 44,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      DateFormat('EEEE').format(today),
                      style: const TextStyle(
                        color: Color(0xfff0f0f0),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      DateFormat('d').format(today),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xfff0f0f0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Text(
                      'TODAY',
                      style: TextStyle(
                        color: Color(0xfff0f0f0),
                        fontSize: 40,
                      ),
                    ),
                    const Text(
                      ' · ',
                      style: TextStyle(
                        color: Color(0xffb22580),
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${dayAsInt + 1}',
                      style: TextStyle(
                        fontSize: 40,
                        color: const Color(0xfff0f0f0).withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Text(
                      '${dayAsInt + 2}',
                      style: TextStyle(
                        fontSize: 40,
                        color: const Color(0xfff0f0f0).withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 40,
                        color: const Color(0xfff0f0f0).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                decoration: BoxDecoration(
                  color: const Color(0xfffef754),
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Column(
                            children: [
                              const Text(
                                '11',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 0.9,
                                ),
                              ),
                              const Text(
                                '30',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                              const Text(
                                '12',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 0.9,
                                ),
                              ),
                              const Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ], // 날짜
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DESIGN',
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w500,
                                height: 0.9,
                              ),
                            ),
                            Text(
                              'MEETING',
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w500,
                                height: 0.9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'ALEX',
                            style: TextStyle(
                              color: Color(0xffa29e2b),
                            ),
                          ),
                          Text(
                            'HELENA',
                            style: TextStyle(
                              color: Color(0xffa29e2b),
                            ),
                          ),
                          Text(
                            'NANA',
                            style: TextStyle(
                              color: Color(0xffa29e2b),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 136, 104, 224),
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Column(
                            children: [
                              const Text(
                                '12',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 0.9,
                                ),
                              ),
                              const Text(
                                '35',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                              const Text(
                                '14',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 0.9,
                                ),
                              ),
                              const Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ], // 날짜
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DAILY',
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w500,
                                height: 0.9,
                              ),
                            ),
                            Text(
                              'PROJECT',
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w500,
                                height: 0.9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'ME',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'RICHARD',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'CIRY',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '+4',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                decoration: BoxDecoration(
                  color: const Color(0xffbcee4b),
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: Column(
                            children: [
                              const Text(
                                '15',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 0.9,
                                ),
                              ),
                              const Text(
                                '00',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                              const Text(
                                '16',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 0.9,
                                ),
                              ),
                              const Text(
                                '30',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ], // 날짜
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WEEKLY',
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w500,
                                height: 0.9,
                              ),
                            ),
                            Text(
                              'PLANNING',
                              style: TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.w500,
                                height: 0.9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'DEN',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'NANA',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            'MARK',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
