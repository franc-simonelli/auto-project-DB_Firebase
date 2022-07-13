// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoproject/provider/auto_provider.dart';
import 'package:autoproject/provider/google_provider.dart';
import 'package:autoproject/screen/login/login_screen.dart';
import 'package:autoproject/utils/constants.dart';
import 'package:autoproject/utils/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../aggiungiCostruttore/aggiungi_costruttore_screen.dart';
import '../dettaglioCostruttore/dettaglio_costruttore_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({ Key? key }) : super(key: key);

  static const String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {

    Provider.of<GoogleProvider>(context, listen: false).getUser();
    Provider.of<AutoProvider>(context, listen: false).getAllCostruttori();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //  gradient: AppTheme.gradientHome
        // ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child:  Consumer<AutoProvider>(builder: (ctx, provider, _) {

              return provider.loading == true
              ?
              loading(context)
              :              
              Column(
                children: [
                  title(context),
                  griglia(provider),
                  SizedBox(height: 20,)
                ],
              );
            }),
          ),
        ),
      ),  
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.grey.shade900,),
        onPressed: (){
          Navigator.of(context).pushNamed(AggiungiCostruttoreScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget griglia(AutoProvider provider) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 40,
        crossAxisSpacing: 50
      ),
      itemCount: provider.getListaCostruttori.length,
      itemBuilder: (context, index) => 
        InkWell(
          child: Image.asset(provider.getListaCostruttori[index].logo),
          onTap: () {
            Provider.of<AutoProvider>(context, listen: false).setCostruttore(provider.getListaCostruttori[index]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DettaglioCostruttore(costruttore: provider.getListaCostruttori[index]),
              ),
            );
          },
        ),
      
    );
  }

  Widget title(BuildContext context) {
    return Consumer<GoogleProvider>(builder: (ctx, provider, _) {
      return provider.user == ''
      ?
      CircularProgressIndicator()
      :
      
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Row(
          children: [
            Expanded(child: Text("Bentornato " + provider.user + '!', style: AppTheme.theme.textTheme.headline3,)),
            NeumorphicButton(
              onPressed: () {
                _showPicker(context);
              },
              style: NeumorphicStyle(
                depth: 2,
                // intensity: 10,
                // lightSource: LightSource.topLeft,
                shadowDarkColor: Colors.black,
                shadowLightColor: Colors.grey.shade700,
                color: Colors.grey.shade900,
                // shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              // padding: const EdgeInsets.all(12.0),
              child: FaIcon(FontAwesomeIcons.bars)
            ),
          
          ],
        ),
      );
    });
  }

  Widget loading(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 24, 24),
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                
              )
            
            ],
          ),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 40,
            crossAxisSpacing: 50
          ),
          itemCount: 6,
          itemBuilder: (context, index) => 
            Container(
            
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 24, 24, 24),
              ),
            )
          
        )
      ],
    );
  }
}

void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            color: Colors.grey.shade900,
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.wrench, color: Colors.grey.shade400,),
                    title: Text('Impostazioni', style: AppTheme.theme.textTheme.headline2,),
                    onTap: () {
                      
                    }),
                ListTile(
                  leading: Icon(Icons.logout_outlined, color: Colors.grey.shade400,),
                  title: Text('Logout', style: AppTheme.theme.textTheme.headline2),
                  onTap: () async{
                    await Provider.of<GoogleProvider>(context, listen: false).signOutFromGoogle();
                    Navigator.of(context).pushNamed(LoginScreen.routeName);

                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }