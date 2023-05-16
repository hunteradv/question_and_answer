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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {'/home': ((context) => QuestionAndAnswerPage())},
    );
  }
}
