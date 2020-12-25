import 'package:flutter/material.dart';
import 'package:flutterLearning/cardsList.dart';
import 'package:flutterLearning/authScreen.dart';
import 'package:flutterLearning/readCard.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          'Tasks',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: CardsList()),
          Expanded(child: ReadData()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AuthScreen();
          }));
        },
      ),
    );
  }
}
