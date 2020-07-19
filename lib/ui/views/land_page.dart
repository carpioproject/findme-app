import 'package:flutter/material.dart';
import 'package:findme/app/services/auth/impl/google_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandPage extends StatelessWidget {
  const LandPage({Key key}) : super(key: key);

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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black, width: 1.2)),
                      color: Colors.white,
                      onPressed: () {
                        GoogleAuth().providerSignIn();
                        print('Loggin in google');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 25,
                            ),
                            Icon(FontAwesomeIcons.google),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Sign in with Google',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.white, width: 1.2)),
                      color: Color.fromRGBO(59, 89, 152, 1),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              FontAwesomeIcons.facebookSquare,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Sign in with Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.white, width: 1.2)),
                      color: Color.fromRGBO(219, 68, 55, 1),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Sign in with Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
