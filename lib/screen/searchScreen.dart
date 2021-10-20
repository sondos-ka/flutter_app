
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants/colors.dart';
import 'package:flutterapp/data/fetchData.dart';
import 'package:flutterapp/data/movie.dart';
import 'package:flutterapp/screen/detailScreen.dart';
import 'package:flutterapp/widgets/movieCard.dart';
import 'package:flutterapp/widgets/searchBar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
 Future<Movie> futureMovie;
 Movie movie= Movie();

 TextEditingController searchController=TextEditingController();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override

  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return Container(
            color: cDarkBlue,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 0),
              child: Column(
                children: [
                  searchBar(MediaQuery
                      .of(context)
                      .size
                      .width - 16.w,
                      8.h,
                      searchController, () {
                        movie.isSearched=false;

                      }, () {
                    movie.isSearched=true;
                    String val=searchController.text;

                        futureMovie =  Provider.of<Movie>(context,listen: false).setmovie(movie, 'http://www.omdbapi.com/?t=$val&apikey=20a020de');

                      }),
                  SizedBox(height: 6.h,)
                  ,
                  FutureBuilder<Movie>(future: futureMovie,
                   builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if(snapshot.data.response=="True"){
                  //snapshot.data.title
                  return Consumer<Movie>(
                      builder: (context, movie, child) {
                        return Container(
                            height: orientation==Orientation.portrait  ?40.h: 30.h,
                            child: GestureDetector(
                              onTap: (){

                               print( Provider.of<Movie>(context,listen: false).title);
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => DetailScreen()),
                               );


                              },

                                child: movieCard(orientation==Orientation.portrait  ?30.h: 20.h,2.h,snapshot.data.poster,snapshot.data.imdbRating,snapshot.data.title,snapshot.data.runtime)));
                      }
                  );}
                    else return Text("no result to show");

                }
                  else if (snapshot.hasError) {
                    return Container(
                      color: Colors.pink,
                      child: Center(child: Text('${snapshot.error}')));
                }
                     else return movie.isSearched? CircularProgressIndicator(color: cLightOrange,): Text("");
              }
          ),
                ],
              ),)
            ,


          );
        }
    );
  }
}
