class SetArticles {
  static int _id = 0;
  final Object article;

  SetArticles(this.article) {
    _id++;
  }

  int get id => _id;
}
