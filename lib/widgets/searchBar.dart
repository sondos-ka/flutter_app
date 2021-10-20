import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants/colors.dart';
import 'package:flutterapp/constants/strings.dart';
import 'package:flutterapp/constants/style.dart';


Widget searchBar(w,h,  controller,Function clear,Function done){
    return Container(
      width: w,
      height: h,

     decoration: BoxDecoration(
       color: cPurple,
        borderRadius: BorderRadius.all(Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25,10,25,10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Image.asset('images/Frame.png')),
            ),
            SizedBox(width: 5),
            Expanded(child:
            TextField(
              controller: controller,
              onSubmitted: (co
                  ){

                done();
                print(co);
              },
                cursorColor: cWhite,
              style: stSearchField,
                decoration: new InputDecoration(
                    hintText: sSearch,
                  hintStyle: stSearchField,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: cPurple),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: cPurple),
                  ),

                )


          )),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
                clear();

              },
                child: Container(
                    child: Image.asset('images/Group 220.png'))),

          )
          ],




          ),
      ),

  );
}