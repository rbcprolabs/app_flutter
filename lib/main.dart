import 'package:flutter/material.dart';
import 'package:rbk/screens/ArticlesList.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// void main() => runApp(RBK());

Future main() async {
  await DotEnv().load('.env');

  runApp(RBK());
}

class RBK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('run');
    print(DotEnv().env['space']);

    return MaterialApp(
        title: 'RBK',
        theme: ThemeData(primarySwatch: Colors.brown),
        home: ArticlesList());
  }
}
