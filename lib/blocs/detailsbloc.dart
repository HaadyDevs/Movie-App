import 'package:movies_app/blocs/basebloc.dart';
import 'package:movies_app/models/responsemodel.dart';
import 'package:rxdart/rxdart.dart';

class DetailsBloc implements  BaseBloc{

  // Creates a Behavior subject to control the movie stream
  BehaviorSubject<Movie> movieDetailsContoller = new BehaviorSubject();

  // Exposes the selected movie details stream
  Stream<Movie> get movieDetailsStream => movieDetailsContoller.stream;

  // Add the selected movie to the stream
  void addDetails(Movie movie){
    movieDetailsContoller.add(movie);
  }

  @override
  void dispose() {
    movieDetailsContoller.close();
  }


}