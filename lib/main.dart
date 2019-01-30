import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rbk/screens/ArticlesList.dart';
import 'package:rbk/screens/Home.dart';
import 'package:rbk/config.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rbk/states/AppState.dart';
import 'package:rbk/redux/store.dart';

Future main() async {
  await DotEnv().load('.env');

  runApp(RBK());
}

class RBK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(DotEnv().env['space']);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));

    return new StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Color(COLOR_5),
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(40.0),
                    child: Container(
                      color: Color(COLOR_1),
                      child: SafeArea(
                        child: Column(
                          children: <Widget>[
                            Expanded(child: Container()),
                            TabBar(
                              labelColor: Color(COLOR_2),
                              indicatorColor: Color(COLOR_2),
                              unselectedLabelColor: Color(COLOR_4),
                              labelPadding: const EdgeInsets.symmetric(
                                  vertical: PADDING - 3),
                              tabs: [
                                Text('Лента'),
                                Text('Избранное'),
                                Text('Настройки')
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                body: TabBarView(
                  children: [
                    ArticlesList(),
                    Home(),
                    // Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              )),
        ));
  }
}
