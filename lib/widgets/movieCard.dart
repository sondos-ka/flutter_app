
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/constants/colors.dart';
import 'package:flutterapp/constants/style.dart';
import 'package:sizer/sizer.dart';

Widget movieCard(h,s,link,rate,name,time){
    return Column(
      children: [
        Stack(
          children: [
            Container( decoration: BoxDecoration(
              image: new DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage(
            link)),
              color: cDarkBlue,
              borderRadius: BorderRadius.all(Radius.circular(20),

              ),
            ),

              height: h,

            )
            , Padding(
                padding:  EdgeInsets.fromLTRB(3.w,2.h,0,0),
                child: Container(
                  height: 4.h,
                    width:20.w,

                    decoration: BoxDecoration(
                      color: cDarkBlue.withOpacity(0.8),

                      borderRadius: BorderRadius.all(Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Row(
                        children: [
                          Container(height:1.5.h,child: Image.asset("images/Star 2.png")),
                          SizedBox(width: 2.w,),
                          Text(rate + "/10 ",style: stRate,),
                        ],
                      ),
                    )),
              ),
          ],
        ),
        SizedBox(height: 2.h,)
        ,Align(

          alignment: Alignment.topLeft,
            child: Text(name,style: stSearchField,)),
        SizedBox(height: 2.h,),
        Row(children: [
          Container(height:2.h ,child: Image.asset("images/Group 356.png")
          ),
          SizedBox(width: 2.h,),
          Text(time,style: stTime,),
        ],)

      ],
    );
}