import 'package:flutter/cupertino.dart';
import 'package:movies_app/blocs/detailsbloc.dart';
import 'package:movies_app/blocs/moviesbloc.dart';

class MovieBlocProvider extends InheritedWidget{

  final MoviesBloc moviesBloc;
  final DetailsBloc detailsBloc;

  MovieBlocProvider({Key key, Widget child})
      : moviesBloc = MoviesBloc(),
        detailsBloc = DetailsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(MovieBlocProvider oldWidget) {
    return true;
  }

  static MoviesBloc movie(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MovieBlocProvider)
    as MovieBlocProvider)
        .moviesBloc;
  }

  static DetailsBloc detail(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MovieBlocProvider)
    as MovieBlocProvider)
        .detailsBloc;
  }
}