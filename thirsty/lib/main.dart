import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirsty/provider/countprovider.dart';
import 'package:thirsty/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext context) => Countprovider(),
        child: Homescreen(),
      ),
    );
  }
}
