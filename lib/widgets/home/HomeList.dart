import 'package:flutter/material.dart';
import 'package:rbk/model/Item.dart';
import 'package:rbk/model/views/ViewModel.dart';

class HomeList extends StatelessWidget {
  final ViewModel model;

  HomeList(this.model);

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
