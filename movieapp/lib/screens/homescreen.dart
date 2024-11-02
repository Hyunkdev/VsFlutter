import 'package:flutter/material.dart';
import 'package:movieapp/models/moviemodel.dart';
import 'package:movieapp/services/api_service.dart';
import 'package:movieapp/widgets/builderwidget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Future<List<Moviemodel>> populars = ApiService.getPopularMovie();
  Future<List<Moviemodel>> now = ApiService.getNowMovie();
  Future<List<Moviemodel>> soon = ApiService.getSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Popular Movie',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                BuilderWidget(
                  future: populars,
                  check: false,
                  width: 300,
                  height: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Now In Cinemas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BuilderWidget(
                  future: now,
                  check: true,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Coming soon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BuilderWidget(
                  future: soon,
                  check: true,
                  width: 120,
                  height: 120,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
