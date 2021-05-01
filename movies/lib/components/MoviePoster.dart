import 'package:flutter/material.dart';
import 'package:movies/models/MovieListing.dart';
import 'package:movies/pages/MovieDetails.dart';

class MoviePoster extends StatelessWidget {

  final double width;
  final Movie movie;
  
  
  const MoviePoster({Key key,this.width, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 

        GestureDetector(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute( builder: (context) {
              return MovieDetails(movie: movie,);
            }, ) );
          },
          child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: (width-30) / 2,
                child: Column(children: [
                      Center(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: movie.largeCoverImage,
          ))
                  
                ],),

              ),
        )
;
    
    

  }
}