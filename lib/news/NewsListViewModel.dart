import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/Apimaneger.dart';
import 'package:news/model/newsRespones/news.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState("message"));
  void loadNews(String? newsId) async {
    emit(LoadingState('Loading...'));
    try {
      var response = await Apimaneger.getnews(newsId);
      if (response.status == 'error') {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.articles));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class NewsListState {}

class SuccessState extends NewsListState {
  List<News>? newsList;
  SuccessState(this.newsList);
}

class LoadingState extends NewsListState {
  String? message;

  LoadingState(this.message);
}

class ErrorState extends NewsListState {
  String? errorMessage;

  ErrorState(this.errorMessage);
}
