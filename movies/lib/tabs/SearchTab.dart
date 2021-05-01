import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/models/MovieListing.dart';
import 'package:movies/pages/MovieDetails.dart';
import 'package:movies/services/Api.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  Api _api = new Api();

  List<Movie> _movies = new List();


  _searchingFor(String str){
    this._api.getMoviesListQuery(str).then((res){

      List<dynamic> movies = json.decode(res.body)['data']['movies'];

     
      MovieListing ml = new MovieListing.fromJson(json.decode(res.body));
      setState(() {
        _movies =ml.data.movies;
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      
      child: Container(
      child: Column(
        children: [

          Container(
            //color: Colors.amber,
            height: 55,
            padding: EdgeInsets.only(left: 15,right: 15),
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (String str){
                _searchingFor(str);
              },
              decoration: InputDecoration(
                hintText: "Searching for..."
              ),
            ),
          ),
          
         Container(
            height: h - 193,
            child: ListView.builder(itemCount: _movies.length, itemBuilder: (context, index) {
              return(
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute( builder: (context) {
              return MovieDetails(movie: _movies[index],);
            }, ) );
                    },
                  leading: Image.network(_movies[index].smallCoverImage),
                  title: Text(_movies[index].title),
                  //subtitle: Text(_movies[index].summary),
                  
                ),
                )
              );
            },),
          )
          
        ],
      ),
    )
    );
  }
}