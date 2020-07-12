import 'package:flutter/material.dart';
import 'package:findme/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindMe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFDB8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7)),
      home: HomePage(),
    );
  }
}
