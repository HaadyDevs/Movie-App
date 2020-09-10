import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/blocs/movieblocprovider.dart';
import 'package:movies_app/models/responsemodel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailScreen extends StatefulWidget {


  DetailScreen();
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  _DetailScreenState();

  @override
  Widget build(BuildContext context) {
    final _bloc = MovieBlocProvider.detail(context);
    return Scaffold(
      body: StreamBuilder<Movie>(
        stream: _bloc.movieDetailsStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            Movie selected = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${selected.backdropPath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                selected.originalTitle,
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                selected.overview,
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Rating",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  starCount: 5,
                                  rating: selected.voteAverage / 2,
                                  size: 35.0,
                                  isReadOnly:true,
                                  color: Colors.yellow,
                                  borderColor: Colors.yellow,
                                  spacing:1.0
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError){
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
