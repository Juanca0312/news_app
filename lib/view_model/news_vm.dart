import 'package:flutter/material.dart';
import 'package:trainee/helper/navigator.dart';
import 'package:trainee/model/news_model.dart';
import 'package:trainee/pages/detail.dart';

class NewsVM extends ChangeNotifier {
  final NavigatorService _navigatorService;

  NewsVM(this._navigatorService);

  navigateToDetail(NewsModel article) {
    //Bad practice to pass context in view model. Thats why we use navigator service
    _navigatorService.goTo(DetailPage(article: article));
  }
}
