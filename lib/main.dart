import 'package:flutter/material.dart';
import 'package:findme/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Baby Names', initialRoute: '/', routes: getApplicationRoutes());
  }
}
