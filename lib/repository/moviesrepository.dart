import 'package:movies_app/models/responsemodel.dart';
import 'package:movies_app/repository/apihelper.dart';
import 'dart:convert';

class MoviesRepository{

  ApiHelper _apiHelper = new ApiHelper();

  Future<ResponseModel> getPopularMovies() async {
    final response = await _apiHelper.get();
    ResponseModel responseModel = ResponseModel.fromJson(json.decode(response));
    return responseModel;
  }
}