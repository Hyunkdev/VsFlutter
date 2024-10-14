import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BBANTO',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 176, 78),
      appBar: AppBar(
        title: const Text("BBANTO"),
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Lucy.jpg'),
                radius: 60,
              ),
            ),

            Divider(
              height: 60.0, // Divider의 높이
              color: Colors.black,
              thickness: 0.5,
              endIndent: 30,
            ),
            Text(
              "Name",
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "BBANTO",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "BBANTO POWER LEVEL",
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "14",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            //ROWWIDGET
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Using lightsaber',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Face hero Tattoo',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Fire flames',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Jinx.jpg'),
                radius: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
