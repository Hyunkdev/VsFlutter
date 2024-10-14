import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // AppBar의 배경색 설정
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("First app"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Hello"), Text("Hello"), Text("Hello")],
          ),
        ));
  }
}

// class MyCard extends StatelessWidget {
//   const MyCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("BBANTO"),
//         centerTitle: true,
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.brown,
//         elevation: 0.0,
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[Text("Hello"), Text("Hello"), Text("Hello")],
//         ),
//       ),
//     );
//   }
// }
