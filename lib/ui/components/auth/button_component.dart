import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Function onPressed;
  final Icon icon;
  final String providerName;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;

  ButtonComponent(
      {Key key,
      this.onPressed,
      this.icon,
      this.providerName,
      this.textColor = Colors.black,
      this.borderColor,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: this.borderColor, width: 1.2)),
          color: this.backgroundColor,
          onPressed: this.onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),
                this.icon,
                SizedBox(
                  width: 10,
                ),
                Text('Sign in with ${this.providerName}',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: this.textColor)),
              ],
            ),
          )),
    );
  }
}
