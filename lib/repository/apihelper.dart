import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:movies_app/models/responsemodel.dart';

class ApiHelper{

  Client httpClient = new Client();
  String apiKey = '9f7a5159459855ac11bc89d52c89f61a';

  Future get() async {
    final responce = await httpClient.get('http://api.themoviedb.org/3/movie/popular?api_key=$apiKey');
    if(responce.statusCode == 200){
      if(responce.body != null){
        return responce.body;
      }
    } else {
      throw Exception("Not Found");
    }
  }
}