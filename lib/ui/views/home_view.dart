import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:findme/app/models/user_model.dart';
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
    return FutureBuilder(
      future: context.select((FirebaseAuthenticator firebaseAuthenticator) =>
          firebaseAuthenticator.currentUser()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          // while data is loading:
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        User user = snapshot.data;
        return RaisedButton(
          onPressed: () {
            context.read<FirebaseAuthenticator>().signOut();
          },
          child: Text('Hello ${user.displayName}'),
        );
      },
    );
    // return Column(children: <Widget>[
    //   Text('Hola mundo'),
    //   RaisedButton(
    //     onPressed: () {
    //       context.read<FirebaseAuthenticator>().signOut();
    //     },
    //     child: Text('Log out'),
    //   )
    // ]);
  }
}
