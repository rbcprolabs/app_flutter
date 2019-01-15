import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbk/config.dart';

class ArticleSourceData extends StatelessWidget {
  ArticleSourceData({this.date, this.source});

  final date;
  final source;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 3,
        height: 12,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Color(COLOR_2),
          borderRadius: BorderRadius.circular(RADIUS),
        ),
      ),
      Container(
        child: Text(
          DateFormat("dd.mm.yyyy, H:m").format(DateTime.parse(date)) +
              ' | ' +
              source.toUpperCase(),
          style: TextStyle(
              color: Color(COLOR_4),
              fontSize: FONT_SIZE - 6,
              fontWeight: FontWeight.w500),
        ),
      )
    ]);
  }
}
