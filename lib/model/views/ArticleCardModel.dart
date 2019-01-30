import 'package:redux/redux.dart';
import 'package:rbk/model/Item.dart';
import 'package:rbk/redux/actions/articles.dart';
import 'package:rbk/states/AppState.dart';

class ArticleCardModel {
  final List<Item> articles;
  final Function(Item) onAdd;

  ArticleCardModel({
    this.articles,
    this.onAdd,
  });

  factory ArticleCardModel.create(Store<AppState> store) {
    _onAdd(Object article) {
      store.dispatch(SetArticles(article));
    }


    return ArticleCardModel(
      articles: store.state.items,
      onAdd: _onAdd,
    );
  }
}