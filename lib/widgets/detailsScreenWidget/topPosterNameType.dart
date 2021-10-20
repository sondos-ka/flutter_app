import 'package:flutter/cupertino.dart';
import 'package:flutterapp/constants/style.dart';
import 'package:sizer/sizer.dart';


Widget topPoster(link, name,type){
  return  Stack(
      children:[
        Opacity(
        opacity: 0.3,
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(

                    link)),
          ),



        ),
      ),
      Align(
  alignment: Alignment.bottomLeft,

  child:   Padding(
    padding: EdgeInsets.fromLTRB(0,0,10.w,10.h),
    child: Column(
      children: [
            Container(
          width: 50.w,
            child: Text(name,style:stTitleShow),

        ),
        SizedBox(height: 3.h,)
        ,Container(child: Text(type,style: stRate),)
      ],
    ),
  ),
)
      ]
    );
}