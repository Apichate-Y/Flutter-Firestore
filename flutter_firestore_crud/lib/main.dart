import 'package:flutter/material.dart';
import 'package:flutter_firestore/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title:'Flutter Demo Firestore CRUD' ),
      debugShowCheckedModeBanner: false,
    );
  }
}
