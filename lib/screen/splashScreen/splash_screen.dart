// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:autoproject/utils/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  static const String routeName = "/splashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("contents/images/app_logo.png", color: AppTheme.purple,),
          Container(
            child: Column(
              children: [
                Text("from", style:AppTheme.theme.textTheme.headline1),
                Text("Francesco Simonelli", style: AppTheme.theme.textTheme.headline1),
              ]
              
            ),
          )
          
        ],
      ),
    );
  }
}