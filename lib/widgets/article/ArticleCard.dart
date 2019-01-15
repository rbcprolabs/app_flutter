import 'package:flutter/material.dart';
import 'package:rbk/config.dart';
import 'package:flutter/rendering.dart';
import 'package:rbk/widgets/article/ArticleSourceData.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard({this.article});

  final article;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: Color(COLOR_1),
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        margin: const EdgeInsets.only(bottom: PADDING),
        padding: const EdgeInsets.symmetric(vertical: INTENT),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: PADDING),
                child: ArticleSourceData(
                  date: article()['published'],
                  source: article()['sources']['fields']['name'],
                )),
            SizedBox(
              width: double.infinity,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN),
                  margin: EdgeInsets.only(top: INTENT),
                  child: Column(
                    children: <Widget>[
                      Text(
                        article()['title'],
                        style: TextStyle(
                            color: Color(COLOR_2),
                            fontSize: FONT_SIZE + 5,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: INTENT),
                        child: Text(
                          article()['lead'],
                          style: TextStyle(
                              color: Color(COLOR_2), fontSize: FONT_SIZE),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
