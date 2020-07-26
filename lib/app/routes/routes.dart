import 'package:flutter/material.dart';
import 'package:findme/ui/views/home_view.dart';
import 'package:findme/ui/views/plan_view.dart';
import 'package:findme/ui/views/land_view.dart';
import 'package:findme/ui/views/settings_view.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    'landpage': (BuildContext context) => LandView(),
    'home': (BuildContext context) => HomeView(),
    '/plan': (BuildContext context) => PlanView(),
    '/settings': (BuildContext context) => SettingsView()
  };
}
