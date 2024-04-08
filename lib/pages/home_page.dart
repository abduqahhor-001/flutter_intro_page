import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {

  static final String id = "home_page";
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("THIS IS HOME PAGE"),),
    );
  }
}