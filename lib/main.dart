import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rbk/screens/ArticlesList.dart';
import 'package:rbk/config.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rbk/model/model.dart';
import 'package:rbk/redux/actions/counterReducer.dart';
import 'package:rbk/redux/reducers/articles.dart';

Future main() async {
  await DotEnv().load('.env');
  
  runApp(RBK());
}

class RBK extends StatelessWidget {
 final Store<AppState> store = Store<AppState>(
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
                    // ArticlesList(),
                    MyHomePage(),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              )),
        ));

    // home: ArticlesList());
  }
}






class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Items'),
      ),
      body: StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) => Column(
              children: <Widget>[
                AddItemWidget(viewModel),
                Expanded(child: ItemListWidget(viewModel)),
                RemoveItemsButton(viewModel),
              ],
            ),
      ),
    );
  }
}

class RemoveItemsButton extends StatelessWidget {
  final _ViewModel model;

  RemoveItemsButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete all Items'),
      onPressed: () => model.onRemoveItems(),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final _ViewModel model;

  ItemListWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: model.items
          .map((Item item) => ListTile(
                title: Text(item.body),
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => model.onRemoveItem(item),
                ),
              ))
          .toList(),
    );
  }
}

class AddItemWidget extends StatefulWidget {
  final _ViewModel model;

  AddItemWidget(this.model);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'add an Item',
      ),
      onSubmitted: (String s) {
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }
}

class _ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  _ViewModel({
    this.items,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return _ViewModel(
      items: store.state.items,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
    );
  }
}

