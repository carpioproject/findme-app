import 'package:flutter/material.dart';
import 'package:findme/src/components/plans_carousel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Column(children: <Widget>[PlansCarousel()]);
  }
}
