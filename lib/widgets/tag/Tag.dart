import 'package:flutter/material.dart';
import 'package:rbk/config.dart';

class Tag extends StatelessWidget {
  Tag({this.title, this.active});

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('test');
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Click on the tag"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        child: Row(children: <Widget>[
          Icon(Icons.star, color: active ? Color(COLOR_3) : Color(COLOR_4)),
          Container(
              padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
              child: Row(children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: active ? Color(COLOR_2) : Color(COLOR_4),
                      fontSize: FONT_SIZE - 2,
                      fontWeight: active ? FontWeight.w500 : FontWeight.w400),
                )
              ]))
        ]));
  }
}
