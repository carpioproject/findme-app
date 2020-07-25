import 'package:flutter/material.dart';

class ModalComponent {
  final Widget _child;
  final String _title;
  final BuildContext _context;

  const ModalComponent(
      {Key key, Widget child, String title, BuildContext context})
      : _child = child,
        _title = title,
        _context = context;

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
}
