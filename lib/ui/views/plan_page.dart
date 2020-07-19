import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({Key key}) : super(key: key);

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
