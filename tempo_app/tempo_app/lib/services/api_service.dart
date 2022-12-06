import 'dart:convert';

import 'package:http/http.dart';
import 'package:tempo_app/model/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2022-12-05&to=2022-12-05&sortBy=popularity&apiKey=4ad59d10031941398aa336758f0e226d";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Cannot get the Articles');
    }
    throw ('error!');
  }
}
