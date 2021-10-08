import 'package:movies_app/blocs/basebloc.dart';
import 'package:movies_app/models/responsemodel.dart';
import 'package:movies_app/repository/moviesrepository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc implements BaseBloc {
  MoviesRepository _moviesRepository = MoviesRepository();
  PublishSubject<ResponseModel> _movieController =
      new PublishSubject<ResponseModel>();

  Stream<ResponseModel> get moviesStream => _movieController.stream;

  MoviesBloc() {
    getMovies();
  }

  Future<ResponseModel> getMovies() async {
    ResponseModel movies = await _moviesRepository.getPopularMovies();
    if (movies.results != null) {
      return true;
    }
    _movieController.add(movies);
  }

  @override
  void dispose() {
    _movieController.close();
  }
}
