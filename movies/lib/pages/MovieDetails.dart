import 'package:flutter/material.dart';
import 'package:movies/models/MovieListing.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  MovieDetails({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {



  String _getGendresFromArray(List<String> gendres){
    String res = "";

    for (var i = 0; i < gendres.length; i++) {
      res+=gendres[i]+", ";
    }


    return res;
  }


  @override
  Widget build(BuildContext context) {
    double h  = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: h-50,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text("",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                      )),
                  background: Image.network(widget.movie.largeCoverImage, fit: BoxFit.cover, )),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(widget.movie.descriptionFull,style: TextStyle( fontSize: 20 ),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text("Gendre",style: TextStyle( fontSize: 30 ),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(_getGendresFromArray(widget.movie.genres),style: TextStyle( fontSize: 20 ),),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movie.genres.length, itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50)

                    ),
                    margin: EdgeInsets.only(right:10),
                    padding: EdgeInsets.only(right: 20,left: 20,top: 5,bottom: 5),
                    child: Text(widget.movie.genres[index]),
                  );
                },),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}