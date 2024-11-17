import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirsty/provider/bottom_nav_provider.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => Countprovider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavProvider()),
        ],
        child: Homescreen(),
      ),
    );
  }
}
