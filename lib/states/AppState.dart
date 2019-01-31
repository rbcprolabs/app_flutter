// import 'package:flutter/foundation.dart';
import 'package:rbk/model/Item.dart';

class AppState {
  final List<Item> items;
  final List<Item> articles;

  AppState({
    this.items,
    this.articles,
  });

  //AppState.initialState(this.items, this.articles);
  // AppState.initialState(): items = List.unmodifiable(<Item>[]);
  AppState.initialState()
    : items = List.unmodifiable(<Item>[]),
      articles = List.unmodifiable(<Item>[]);
}
