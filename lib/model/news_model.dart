import 'package:trainee/model/source.dart';

class NewsModel {
  String? title;
  String? author;
  SourceModel? source;
  String? publishedAt;
  String? urlToImage;
  String? content;

  NewsModel({this.title, this.author, this.source, this.publishedAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? SourceModel.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}
