class DataConstant {
  static final DataConstant _instance = DataConstant();
  static DataConstant get instance => _instance;
  String baseUrl =
      'https://raw.githubusercontent.com/benoitvallon/100-best-books/master';
  String endPoint = '/books.json';
}
