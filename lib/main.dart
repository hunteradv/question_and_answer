import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'question_and_answer.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyDR3BgT4vNoCyGoLwsnDScK7NJLc4amVeU",
    authDomain: "question-and-answer-93e05.firebaseapp.com",
    projectId: "question-and-answer-93e05",
    storageBucket: "question-and-answer-93e05.appspot.com",
    messagingSenderId: "963898576694",
    appId: "1:963898576694:web:730cf844d15b88f5f02d97");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      auth.signInAnonymously();
    }

    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: QuestionAndAnswerPage(),
    );
  }
}
