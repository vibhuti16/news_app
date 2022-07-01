
import 'package:http/http.dart';

import '../helpers/app_constants.dart';
import '../models/newsResponseModel.dart';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = AppConstants.newsApiKey;

  Future<List<Article>?> fetchNewsList({String category = ''}) async {
    var url =
        "${AppConstants.baseUrl}${AppConstants.topHeadLine}?country=in&apiKey=$_apiKey&category=$category";
    print("entered Url : $url");
    final response = await client.get(Uri.parse(url));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return NewsApiResonse.fromRawJson(response.body).articles;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
