import 'package:flutter/material.dart';
import 'package:mbh/UI/Screens/login.dart';

import 'UI/Screens/food.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maclat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: FoodScreen(),
    );
  }
}
