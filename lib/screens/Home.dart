import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rbk/config.dart';
import 'package:rbk/model/views/ViewModel.dart';
import 'package:rbk/states/AppState.dart';
import 'package:rbk/widgets/home/AddItem.dart';
import 'package:rbk/widgets/home/RemoveButton.dart';
import 'package:rbk/widgets/home/HomeList.dart';
import 'package:redux/redux.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(COLOR_5),
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Column(
              children: <Widget>[
                AddItem(viewModel),
                Expanded(child: HomeList(viewModel)),
                RemoveButton(viewModel),
              ],
            ),
      ),
    );
  }
}