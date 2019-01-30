import 'package:rbk/model/Item.dart';
import 'package:rbk/redux/actions/articles.dart';

List<Item> articleReducer(List<Item> state, action) {
  if (action is SetArticles) {
    return []
      ..addAll(state)
      ..add(Item(id: action.id, body: action.article));
  }


  return state;
}