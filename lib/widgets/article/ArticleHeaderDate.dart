import 'package:flutter/material.dart';
import 'package:rbk/config.dart';
import 'package:moment/moment.dart';

class ArticleHeaderDate extends StatelessWidget {
  ArticleHeaderDate({this.date, this.source});

  final date;
  final source;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        margin: const EdgeInsets.only(bottom: PADDING),
        width: 48.0,
        height: 48.0,
        child: new Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Container(
            width: 3,
            height: 12,
            decoration: new BoxDecoration(
              color: Color(COLOR_2),
              borderRadius: BorderRadius.circular(RADIUS),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
            margin: EdgeInsets.all(2.0),
            child: Text(
              date.toUpperCase() + ' | ' + source.toUpperCase(),
              style: TextStyle(
                  color: Color(COLOR_4),
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
            // child: Text(Moment(date).format('DD.MM.YY, h:mm')),
          )
        ]));
  }
}
