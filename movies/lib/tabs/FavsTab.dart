import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/models/MovieListing.dart';
import 'package:movies/models/OneMovie.dart';
import 'package:movies/pages/MovieDetails.dart';
import 'package:movies/services/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({Key key}) : super(key: key);

  @override
  _FavoriteTabState createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  Api api = new Api();
  List<String> _ids = new List();


  _getSavedIds() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favsIds= prefs.getStringList('favoris');
    setState(() {
      _ids = favsIds;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSavedIds();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView.builder(itemCount: _ids.length, itemBuilder: (context, index) {
         return FutureBuilder(
           future: api.getMovieDetails(_ids[index]),
           builder: (context, snapshot) {
             if (snapshot.hasError) {
               return(
                 Container(
                   child: Text("Something went wrong :(."),
                 )
               );
             }

             if (snapshot.hasData) {
               var bodyJSON = json.decode(snapshot.data.body);
                Movie m = new Movie.fromJson(bodyJSON['data']['movie']);
               
             
              
               return(
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute( builder: (context) {
              return MovieDetails(movie: m,);
            }, ) );
                    },
                  leading: Image.network(m.smallCoverImage),
                  title: Text(m.title),
                  //subtitle: Text(_movies[index].summary),
                  
                ),
                )
               );
             }

            return Container(
              height: 80,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );


           },
         );
       },),
    );
  }
}