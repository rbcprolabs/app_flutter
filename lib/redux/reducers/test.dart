import 'package:rbk/model/Item.dart';
import 'package:rbk/redux/actions/counterReducer.dart';

List<Item> testReducer(List<Item> state, action) {
  if (action is TestItemAction) {
    return []
      ..addAll(state)
      ..add(Item(id: action.id, body: action.item));
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  return state;
}