import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants/colors.dart';
import 'package:flutterapp/data/movie.dart';
import 'package:flutterapp/screen/searchScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
 FutureProvider(
     create: (context)=> Movie().fetchMovie("http://www.omdbapi.com/?t=Guardians%20of%20the%20Galaxy%20Vol.%202&apikey=20a020de"),
      child:
MyApp())
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}
class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        theme: ThemeData.dark().copyWith(
            brightness: Brightness.dark,
            primaryColor:cLightPurple


        ),
        home: Scaffold(
          backgroundColor: cDarkBlue,
          body: SearchScreen(),
          ),
        );


  }

}