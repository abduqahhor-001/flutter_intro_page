import 'package:flutter/material.dart';
import 'package:flutter_intro_page/pages/home_page.dart';
import 'package:flutter_intro_page/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Intro_page(),
      routes: {
        Home_page.id:(context) => Home_page(),
        Intro_page.id:(context) => Intro_page(),
      },
    );
  }
}

