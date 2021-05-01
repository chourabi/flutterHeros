
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies/components/MoviePoster.dart';
import 'package:movies/models/MovieListing.dart';
import 'package:movies/services/Api.dart';
import 'dart:convert';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  bool _isLoading = true;
  bool _isError = false;

  Api _api = new Api();

  List<Movie> _movies = new List();

  _getMoviesList(){
    _isError =false;
    _isLoading = true;
    _api.getMoviesList().then((res){

      List<dynamic> movies = json.decode(res.body)['data']['movies'];

     
      MovieListing ml = new MovieListing.fromJson(json.decode(res.body));
      setState(() {
        _movies =ml.data.movies;
      });


      setState(() {
        _isLoading = false;
      });


    }).catchError((err){
      log(err.toString());
      setState(() {
        _isLoading = false;
        _isError = true;
        
      });

    });
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getMoviesList();
  }






  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return 

    _isLoading == true ?
    Center(
      child: CircularProgressIndicator(),
    )
    :    
    
    

    _isError == false ?
    Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(itemCount: (_movies.length ~/ 2 ).toInt(),itemBuilder: (context, index) {
        return(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoviePoster(movie: _movies[index*2],width: w,),
              MoviePoster(movie: _movies[(index*2) +1 ],width: w,),
              // 0 0 1
              // 1 2 3
              // 2 4 5
              // 3 6 7
              // 4 8 9
              
            ],
          )
        );
      },),
    ):

    Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Something went wrong\nTry again.",textAlign: TextAlign.center,),
          FlatButton(child: Text('TRY AGAIN'),onPressed: (){
            _getMoviesList();
          },)
        ],
      ),
    );
  }
}