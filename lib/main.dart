import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rbk/screens/ArticlesList.dart';
import 'package:rbk/config.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rbk/redux/reducers/articles.dart';

Future main() async {
  await DotEnv().load('.env');
  
  runApp(RBK());
}

class RBK extends StatelessWidget {
 final Store store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );

  // final Store<int> store;

  // RBK({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(DotEnv().env['space']);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));

    return new StoreProvider<int>(
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
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              )),
        ));

    // home: ArticlesList());
  }
}



// class MyHomePage extends StatelessWidget {
//   final store = new Store<MyAppState>(counterReducer, initialState: MyAppState(0));
 
//   @override
//   Widget build(BuildContext context) {
//     return new StoreProvider(
//       store: store,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('grokonez Redux Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               StoreConnector<MyAppState, String>(
//                   converter: (store) => store.state.counter.toString(),
//                   builder: (context, counter) {
//                     return Text(
//                       counter,
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 20.0,
//                       ),
//                     );
//                   }),
//               Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: StoreConnector<MyAppState, VoidCallback>(
//                     converter: (store) {
//                       return () => store.dispatch({
//                             'type': Actions.INCREMENT,
//                             'number': 3,
//                           });
//                     },
//                     builder: (context, callback) {
//                       return RaisedButton(
//                         child: Text('INC'),
//                         onPressed: callback,
//                       );
//                     },
//                   )),
//               StoreConnector<MyAppState, VoidCallback>(
//                 converter: (store) {
//                   return () => store.dispatch({
//                         'type': Actions.DECREMENT,
//                         'number': 2,
//                       });
//                 },
//                 builder: (context, callback) {
//                   return RaisedButton(
//                     child: Text('DEC'),
//                     onPressed: callback,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
