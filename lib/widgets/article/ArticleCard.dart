import 'package:flutter/material.dart';
import 'package:rbk/config.dart';
import 'package:flutter/rendering.dart';
import 'package:rbk/widgets/article/ArticleHeaderDate.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard({this.article});

  final article;

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
      // Разбить максимально на компоненты (виджеты)
      child: ArticleHeaderDate(
        date: article()['published'],
        source: article()['sources']['fields']['name'],
      )
    );
  }
}
