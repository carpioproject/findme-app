import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:findme/app/services/auth/firebase_authenticator.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/plan')},
        child: Icon(Icons.add),
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Text('Hola mundo'),
      RaisedButton(
        onPressed: () {
          context.read<FirebaseAuthenticator>().signOut();
        },
        child: Text('Log out'),
      )
    ]);
  }
}
