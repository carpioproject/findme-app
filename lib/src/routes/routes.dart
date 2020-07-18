import 'package:flutter/material.dart';
import 'package:findme/src/pages/home_page.dart';
import 'package:findme/src/pages/plan_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    '/': (BuildContext context) => HomePage(),
    '/plan': (BuildContext context) => PlanPage()
  };
}
