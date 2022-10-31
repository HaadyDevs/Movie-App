import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/blocs/movieblocprovider.dart';
import 'package:movies_app/blocs/moviesbloc.dart';
import 'package:movies_app/models/responsemodel.dart';
import 'package:movies_app/ui/detailscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = MovieBlocProvider.movie(context);
    final _detailsBloc = MovieBlocProvider.detail(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: _bloc.moviesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildGrid(snapshot, _detailsBloc);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildGrid(snapshot, detailsBloc) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          Movie movie = snapshot.data.results[index];
          return InkResponse(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Column(
                  children: [
                    Flexible(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w185${movie.posterPath}',
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      movie.originalTitle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              detailsBloc.addDetails(movie);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen()));
            },
          );
        });
  }
}
