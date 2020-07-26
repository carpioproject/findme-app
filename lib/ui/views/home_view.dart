import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:findme/app/models/user_model.dart';
import 'package:findme/app/services/auth/firebase_authenticator.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FindMe app'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/plan')},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(child: _buildFutureBuilder(context)),
    );
  }

  Widget _buildFutureBuilder(BuildContext context) {
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

        return _buildBody(user: snapshot.data, context: context);
      },
    );
  }

  Widget _buildBody({User user, BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: <Widget>[
          Text(
            'Your plans coming',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => print('See all'),
            child: Text(
              'See all',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0),
            ),
          )
        ],
      ),
    );
  }
}
