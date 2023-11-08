import 'dart:convert';

import 'package:trainee/model/news_model.dart';
import 'package:trainee/utils/const.dart';
import 'package:http/http.dart' as http;

class NewsService {
  String newsURL = "${K.baseURL}everything";

  Future<List<NewsModel>> getAll() async {
    List<NewsModel> news = [];

    final url = Uri.parse("$newsURL?apiKey=${K.apiKey}&q=software");
    print("Call to service getAllNews with url ${url.toString()}");
    //url.replace(queryParameters: {"apiKey": K.apiKey, "q": "software"});


    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResult = json.decode(response.body);

        List<dynamic> articles = jsonResult["articles"];
        news = articles.map((article) => NewsModel.fromJson(article)).toList();

        return news;
      } else {
        print(response.statusCode);

        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
