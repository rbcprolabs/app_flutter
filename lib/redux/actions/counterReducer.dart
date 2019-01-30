import 'package:rbk/model/Item.dart';

class TestItemAction {
  static int _id = 0;
  final String item;

  TestItemAction(this.item) {
    _id++;
  }

  int get id => _id;
}

class RemoveItemAction {
  final Item item;

  RemoveItemAction(this.item);

}

class RemoveItemsAction {}
