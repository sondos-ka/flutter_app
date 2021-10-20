import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;



class Movie with ChangeNotifier{

  final String title;
  final String year;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String imdbRating;
  final String type;
 final String totalSeasons;
  final String response;

  bool isSearched=false;

Movie({ this.actors, this.awards,  this.country, this.director,  this.genre, this.imdbRating,
  this.language, this.plot, this.poster, this.released , this.response,
  this.runtime, this.title, this.totalSeasons, this.type,this.writer, this.year});




      factory Movie.fromJson(Map<String, dynamic> json) {

         return Movie(
           actors: json['Actors'],
           awards: json['Awards'],
           country: json['Country'],
           director: json['Director'],
           genre: json['Genre'],
           imdbRating: json['imdbRating'],
           language: json['Language'],
           plot: json['Plot'],
           poster: json['Poster'],
           released: json['Released'],
           response: json['Response'],
           runtime: json['Runtime'],
           title: json['Title'],
           totalSeasons: json['TotalSeasons'],
           type: json['Type'],
           writer: json['Writer'],
           year: json['Year'],
         );


     }



     setmovie(movie,url){
      movie.fetchMovie(url);
      notifyListeners();
     }

  Future<Movie> fetchMovie(String URL) async {
    final response = await http
        .get(Uri.parse(URL));

    if (response.statusCode == 200) {
      Map<String, dynamic> userdata = new Map<String, dynamic>.from(json.decode(response.body));

      Movie movie=Movie.fromJson(userdata);
      print("moooovie");
      print(movie.title);

      return movie;
    }


    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Faild to load');
    }

  }




  //{"Rated":"N/A","Country":"Canada","Awards":"1 win & 5 nominations"
  // ,"Poster":"https://m.media-amazon.com/images/M/MV5BMTM0NzUwNjk5MF5BMl5BanBnXkFtZTcwOTk3NDM4NA@@._V1_SX300.jpg"
  // ,"Ratings":[{"Source":"Internet Movie Database","Value":"7.6/10"}],"Metascore":"N/A","imdbRating":"7.6","imdbVotes":"3,
  // \532","imdbID":"tt1797629","Type":"series","totalSeasons":"1","Response":"True"}
}