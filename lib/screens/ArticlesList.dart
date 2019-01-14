import 'package:flutter/material.dart';
import 'package:rbk/widgets/article/ArticleData.dart';
import 'package:rbk/widgets/article/ArticleCard.dart';
import 'package:rbk/widgets/containers/ContainerList.dart';
//import 'package:http/http.dart' as http;

class ArticlesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ArticlesListState();
  }
}

class ArticlesListState extends State<ArticlesList> {
  List<ArticleData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RBK')),
      body: ContainerList(
        children: _buildList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: () => _load()),
    );
  }

  _load() {
    // final String url = 'https://api.coinmarketcap.com/v2/ticker/?limit=100';
    // final response = await http.get(url);
    final dataTest = [
      {
        'title': 'title',
        'published': '20.10.20',
        'sources': {
          'fields': {'name': 'rbk russia'}
        }
      },
      {
        'title': 'title',
        'published': '20.10.1208',
        'sources': {
          'fields': {'name': 'rbk ukraine'}
        }
      },
    ];
    print('dataList $dataTest');

    // var allData = dataTest as Map<String, dynamic>;
    var dataList = List<ArticleData>();
    // print('dataList $dataList');

    dataTest.forEach((dynamic article) {
      var record = ArticleData(
        article: article,
      );

      dataList.add(record);
    });

    setState(() {
      data = dataList;
    });
  }

  List<Widget> _buildList() {
    return data
        .map((ArticleData article) => ArticleCard(article: article))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _load();
  }
}
