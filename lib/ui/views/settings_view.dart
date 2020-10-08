import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:findme/app/services/auth/firebase_authenticator.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  context.read<FirebaseAuthenticator>().signOut();
                  Navigator.pop(context);
                },
                child: Text('Log out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
