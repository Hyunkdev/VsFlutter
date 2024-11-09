import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Container(
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [
              //         Colors.blueAccent,
              //         Colors.deepPurple,
              //       ],
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //     ),
              //   ),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Column(
                  children: [
                    Text(
                      'Asdjfoisdjfoisdjfoi',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
