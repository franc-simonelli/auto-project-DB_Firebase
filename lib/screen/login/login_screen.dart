import 'package:autoproject/provider/google_provider.dart';
import 'package:autoproject/screen/home/homePage_screen.dart';
import 'package:autoproject/utils/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  static const String routeName = "/loginscreen";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Benvenuto!", style: AppTheme.theme.textTheme.headline3,),
                      Text("Effettua il login", style: AppTheme.theme.textTheme.headline5),
                      Text("con Google", style: AppTheme.theme.textTheme.headline5),
                    ],
                  ),
                ),
                Image.asset("contents/images/app_logo.png", width: 50, color: Colors.white,),
              ],
            ),
          ),
          
          
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
            ),
            onPressed: () async {
              try{
                await Provider.of<GoogleProvider>(context, listen: false).signInwithGoogle();
                Navigator.of(context).pushNamedAndRemoveUntil(HomePageScreen.routeName, (route) => false);
              }
              catch(err){
                print(err);
                // _showMyDialogError();
              }
            }, 
            icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
            label: Text("Sign UP with Google", style: AppTheme.theme.textTheme.headline4,),
          ),
        ],
      )
    );
  }
}