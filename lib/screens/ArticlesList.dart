import 'package:flutter/material.dart';
import 'package:rbk/widgets/article/ArticleData.dart';
import 'package:rbk/widgets/article/ArticleCard.dart';
import 'package:rbk/widgets/containers/ContainerList.dart';
import 'package:rbk/config.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:rbk/redux/types.dart';
import 'package:rbk/redux/reducers/articles.dart';
import 'package:rbk/redux/store.dart';
//import 'package:http/http.dart' as http;

class ArticlesList extends StatefulWidget {
    // final Store<int> store;
      // ArticlesList({Key key, this.store}) : super(key: key);


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
      backgroundColor: Color(COLOR_5),
      body: ContainerList(
        children: [
           _buildList(),
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Color(COLOR_2),
          onPressed: () => _load()),
   
    );

    
  
  }

  _load() {
    // final String url = 'https://api.coinmarketcap.com/v2/ticker/?limit=100';
    // final response = await http.get(url);
    final dataTest = [
      {
        'title': 'X5 Ретейл групп открывать новый набор',
        'lead':
            'Китайские туристы и граждане КНР, проживающие в России, смогут оплачивать покупки в супермаркетах Prisma привычным и удобным для них способом. В Санкт-Петербурге представлено 13 магазинов сети, предоставляющих большое разнообразие зарубежных товаров',
        'published': '2018-12-19T08:56',
        'sources': {
          'fields': {'name': 'rbk russia'}
        }
      },
      {
        'title': 'X5 Ретейл групп открывать новый набор',
        'lead':
            'Китайские туристы и граждане КНР, проживающие в России, смогут оплачивать покупки в супермаркетах Prisma привычным и удобным для них способом. В Санкт-Петербурге представлено 13 магазинов сети, предоставляющих большое разнообразие зарубежных товаров',
        'published': '2018-11-11T06:22',
        'sources': {
          'fields': {'name': 'rbk ukraine'}
        }
      },
    ];
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
