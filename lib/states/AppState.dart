import 'package:flutter/foundation.dart';
import 'package:rbk/model/Item.dart';

class AppState {
  final List<Item> items;

  AppState({
    @required this.items,
  });

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
}
