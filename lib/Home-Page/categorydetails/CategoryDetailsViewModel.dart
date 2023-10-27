import 'package:flutter/material.dart';
import 'package:news/api/Apimaneger.dart';
import 'package:news/model/sourceResponse/Source.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Source>? listSource;
  String? errorMessage;
  bool? showLoading;
  getSouce(String categoryID) async {
    showLoading=true;
    notifyListeners();
    try {
      var response = await Apimaneger.getSources(categoryID);

      showLoading=null;
      if (response.status == 'error') {
      } else {
        listSource = response.sources;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
