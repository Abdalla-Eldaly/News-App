import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/Apimaneger.dart';
import 'package:news/model/sourceResponse/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDeyailsState> {
  CategoryDetailsViewModel() : super(LoadingState("message"));

  void loadSource(String categoryID) async {
    emit(LoadingState('Loading...'));
    try {
      var response = await Apimaneger.getSources(categoryID);
      if (response.status == 'error') {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.sources));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class CategoryDeyailsState {}

class SuccessState extends CategoryDeyailsState {
  List<Source>? sourceList;
  SuccessState(this.sourceList);
}

class LoadingState extends CategoryDeyailsState {
  String? message;

  LoadingState(this.message);
}

class ErrorState extends CategoryDeyailsState {
  String? errorMessage;

  ErrorState(this.errorMessage);
}
