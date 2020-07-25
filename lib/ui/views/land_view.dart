import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:findme/app/services/auth/impl/google_auth.dart';
import 'package:findme/app/services/auth/impl/facebook_auth.dart';

import 'package:findme/ui/components/auth/button_component.dart';

class LandView extends StatelessWidget {
  const LandView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(40)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 170, 155, 1),
                      Color.fromRGBO(0, 170, 155, 0.3)
                    ])),
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: double.infinity, height: 35),
                Text(
                  'Welcome to',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: double.infinity, height: 5),
                Text(
                  'the findMe app',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(width: double.infinity, height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
                        child: Icon(
                          Icons.wb_sunny,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
                        child: Icon(
                          Icons.local_pizza,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
                        child: Icon(
                          Icons.directions_car,
                          size: 40,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    'This app is made with the ilusion to create a plans for enjoying life with people and friends',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            )),
            constraints:
                BoxConstraints.expand(width: double.infinity, height: 500),
          ),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                ButtonComponent(
                  borderColor: Colors.black,
                  backgroundColor: Colors.white,
                  icon: Icon(FontAwesomeIcons.google),
                  providerName: 'Google',
                  onPressed: () {
                    GoogleAuthenticator().providerSignIn();
                    print('Loggin in google');
                  },
                ),
                ButtonComponent(
                  borderColor: Colors.white,
                  backgroundColor: Color.fromRGBO(59, 89, 152, 1),
                  textColor: Colors.white,
                  icon: Icon(
                    FontAwesomeIcons.facebookSquare,
                    color: Colors.white,
                  ),
                  providerName: 'Facebook',
                  onPressed: () {
                    FacebookAuthenticator().providerSignIn();
                    print('Loggin in facebook');
                  },
                ),
                ButtonComponent(
                  borderColor: Colors.white,
                  backgroundColor: Color.fromRGBO(219, 68, 55, 1),
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.mail_outline,
                    color: Colors.white,
                  ),
                  providerName: 'Email',
                  onPressed: () {
                    print('Loggin in email');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
