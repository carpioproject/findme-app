import 'package:flutter/material.dart';

class PlanView extends StatelessWidget {
  const PlanView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Plan Page')),
        body: Text('Plan page'),
      ),
    );
  }
}
