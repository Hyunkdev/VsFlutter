import 'package:flutter/material.dart';
import 'package:real_toonflix/widgets/webtoon_widget.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.id,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
