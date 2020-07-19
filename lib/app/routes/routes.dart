import 'package:flutter/material.dart';
import 'package:findme/ui/views/home_page.dart';
import 'package:findme/ui/views/plan_page.dart';
import 'package:findme/ui/views/land_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    'landpage': (BuildContext context) => LandPage(),
    'home': (BuildContext context) => HomePage(),
    '/plan': (BuildContext context) => PlanPage()
  };
}
