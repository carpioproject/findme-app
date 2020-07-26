import 'package:flutter/material.dart';

class ModalComponent {
  static ModalComponent instance;
  Widget _child;
  String _title;
  BuildContext _context;

  ModalComponent._internal(
      {Key key, Widget child, String title, BuildContext context}) {
    _child = child;
    _title = title;
    _context = context;
  }

  factory ModalComponent(
      {Key key, Widget child, String title, BuildContext context}) {
    instance =
        ModalComponent._internal(child: child, title: title, context: context);

    return instance;
  }

  showModal() {
    showDialog(
        context: _context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Text(_title),
              content: IntrinsicHeight(
                child: _child,
              ));
        });
  }

  closeModal() {
    Navigator.pop(_context);
  }
}
