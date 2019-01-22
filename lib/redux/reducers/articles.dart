import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rbk/redux/types.dart';
import 'package:rbk/redux/actions/counterReducer.dart';

class AppState {
  final List<Item> items;

  AppState({
    this.items,
  });

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
}
 
AppState appStateReducer(AppState state, action) {
  return AppState(
    items: itemReducer(state.items, action),
  );
}

List<Item> itemReducer(List<Item> state, action) {
  if (action is AddItemAction) {
    return []
      ..addAll(state)
      ..add(Item(id: action.id, body: action.item));
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  return state;
}