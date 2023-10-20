
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/newsRespones/NewsRespones.dart';
import 'package:news/model/sourceResponse/SourceResponse.dart';
class Apimaneger{
  static const  baseurl ='newsapi.org';
  static const  apikey ='012d0f35ad4343fe8d243ff88f61dca4';
  static Future<SourceResponse>getSources(String categoryID)async{
    var uri =Uri.https(baseurl,'v2/top-headlines/sources',{
      "apiKey":apikey,
      "category":categoryID
    });
   var response = await http.get(uri);
   var json =jsonDecode(response.body);
   var jsonresponse = SourceResponse.fromJson(json);
   return jsonresponse;
  }


  static Future<NewsRespones>getnews(String? sourceID)async{
    var uri =Uri.https(baseurl,'v2/everything',
    {
      "apiKey":apikey,
      "sources":sourceID,

    });
    var response =await http.get(uri);
    var json= jsonDecode(response.body);
    var jsonresponse= NewsRespones.fromJson(json);
    return jsonresponse;
  }
}