import 'package:flutter/material.dart';
import 'package:flutterLearning/authForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  Future<void> _submitAuthForm(
    String email,
    String password,
  ) async {
    var authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance.collection('user').doc(authResult.user.uid).set({
      'Email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Auth(_submitAuthForm),
    );
  }
}
