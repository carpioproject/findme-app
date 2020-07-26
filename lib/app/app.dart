import 'package:findme/app/services/user/user_service.dart';
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
        title: 'Findme app',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(0, 170, 155, 1),
            accentColor: Color.fromRGBO(251, 188, 5, 1)),
        routes: getApplicationRoutes(),
        home: Consumer<User>(builder: (_, user, __) {
          if (user == null) {
            UserService.logout();
            return LandView();
          }

          UserService(user: user);

          return HomeView();
        }));
  }
}
