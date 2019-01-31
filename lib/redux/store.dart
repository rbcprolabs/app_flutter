import 'package:rbk/model/Item.dart';
import 'package:rbk/redux/actions/articles.dart';
import 'package:rbk/redux/actions/counterReducer.dart';
import 'package:rbk/redux/reducers/test.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:rbk/states/AppState.dart';
import 'package:rbk/redux/reducers/articles.dart';

final Reducer <List<Item>> itemsReducer = combineReducers <List<Item>>([
  TypedReducer<List<Item>, SetArticles>(articleReducer),
]);

final Reducer <List<Item>> itemsReducer2 = combineReducers <List<Item>>([
  TypedReducer<List<Item>, SetArticles>(articleReducer),
]);

AppState appStateReducer(AppState state, action) {
  print('state $state');
  return AppState(
    items: itemsReducer(state.items, action),
    articles: itemsReducer2(state.articles, action),
  );
}

final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware],
    );