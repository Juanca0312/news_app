import 'package:flutter/material.dart';
import 'package:trainee/helper/navigator.dart';
import 'package:trainee/model/news_model.dart';
import 'package:trainee/pages/detail.dart';
import 'package:trainee/services/news_service.dart';

class NewsVM extends ChangeNotifier {
  final NavigatorService _navigatorService;
  List<NewsModel> news = [];

  NewsVM(this._navigatorService) {
    getAll();
  }

  navigateToDetail(NewsModel article) {
    //Bad practice to pass context in view model. Thats why we use navigator service
    _navigatorService.goTo(DetailPage(article: article));
  }

  getAll() async {
    _navigatorService.showLoader();
    await Future.delayed(Duration(seconds: 3));
    news = await NewsService().getAll();
    _navigatorService.pop();
    notifyListeners();
  }
}
