



import 'package:flutter/cupertino.dart';
import 'package:flutterapp/constants/colors.dart';
import 'package:flutterapp/data/movie.dart';
import 'package:flutterapp/widgets/detailsScreenWidget/topPosterNameType.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return Container(
              color: cDarkBlue,
              child: Consumer<Movie>(
                  builder: (context, movie, child) {
                    return Column(
                      children: [
                        topPoster(movie.poster, movie.title, movie.genre),
                      ],
                    );
                  }));
        });
  }
}