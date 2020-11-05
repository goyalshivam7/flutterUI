import 'package:flutter/material.dart';
import 'package:flutterLearning/cardsList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'WorkTrolly',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: CardsList(),
    );
  }
}
