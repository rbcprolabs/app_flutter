import 'package:rbk/states/AppState.dart';
import 'package:redux/redux.dart';
import 'package:rbk/redux/reducers/articles.dart';

final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [],
    );