import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:findme/app/routes/routes.dart';
import 'package:findme/ui/views/home_view.dart';
import 'package:findme/ui/views/land_view.dart';
import 'package:findme/app/models/user_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Baby Names',
        routes: getApplicationRoutes(),
        home: Consumer<User>(builder: (_, user, __) {
          if (user == null) {
            return LandView();
          }

          return HomeView();
        }));
  }
}
