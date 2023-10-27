import 'package:flutter/material.dart';
import 'package:news/api/Apimaneger.dart';
import 'package:news/model/newsRespones/news.dart';

class NewsListViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;
  bool? showLoading;
  getNews(String categoryID) async {
    showLoading = true;
    errorMessage =null;
    newsList = null;
    notifyListeners();
    try {
      var response = await Apimaneger.getnews(categoryID);
      showLoading = false;
      notifyListeners();
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
