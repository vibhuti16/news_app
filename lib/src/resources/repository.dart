
import '../models/newsResponseModel.dart';
import 'news_api.dart';

class Repository {
  final moviesApiProvider = NewsApiProvider();
  Future<List<Article>?> fetchAllNews({String category = ''}) => moviesApiProvider.fetchNewsList(category:category);
}