import 'package:flutter/material.dart';
import 'package:rbk/model/views/ViewModel.dart';

class RemoveButton extends StatelessWidget {
  final ViewModel model;

  RemoveButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete all Items'),
      onPressed: () => model.onRemoveItems(),
    );
  }
}