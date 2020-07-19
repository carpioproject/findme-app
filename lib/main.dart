import 'package:findme/app/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:findme/app/preferences/user_preferences.dart';
import 'package:findme/app/services/auth/firebase_authenticator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = UserPreferences();

  await preferences.initPreferences();

  runApp(MultiProvider(providers: [
    Provider(
      create: (_) => FirebaseAuthenticator(),
    ),
    StreamProvider(
      create: (context) =>
          context.read<FirebaseAuthenticator>().onAuthStateChanged,
    ),
  ], child: MyApp()));
}
