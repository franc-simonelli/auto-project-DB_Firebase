// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_new, unused_element, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:autoproject/provider/auto_provider.dart';
import 'package:autoproject/utils/constants.dart';
import 'package:autoproject/utils/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DettaglioCostruttore extends StatefulWidget {
  const DettaglioCostruttore({ Key? key, this.costruttore }) : super(key: key);

  final costruttore;

  @override
  State<DettaglioCostruttore> createState() => _DettaglioCostruttoreState();
}

class _DettaglioCostruttoreState extends State<DettaglioCostruttore> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    late TabController _tabController = new TabController(initialIndex: 0, length: 2, vsync: this);

    @override
    void initState(){
      super.initState();
    }
    
    return Scaffold(
      body: Column(
        children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    titleWidget(),
                    detilsWidget()


                  ],
                ),
              
              ),
            ),

            Expanded(
              flex: 4,
              child:  Consumer<AutoProvider>(builder: (ctx, provider, _) {
                return Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                  ),
                  child: tabBarWidget(_tabController, provider),
                  
                  
                );
              })
            )
  
        ],
      ),
    );
  }

  Widget tabBarWidget(TabController _tabController, AutoProvider provider) {
    return Column(
      children: [
        TabBar( 
          unselectedLabelColor: Colors.grey.shade100,
          labelColor: Colors.grey.shade900,
          tabs: [
            Tab(icon: Icon(Icons.car_rental_outlined)),
            Tab(icon: Icon(Icons.info_outline)),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Text(provider.costruttoreScelto.descrizione, style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),

              provider.loading
              ?
              Center(
                child: CircularProgressIndicator(),
              )
              :
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Image.asset(provider.getlistaAuto[0].immagine, width: 100,),
                ),
              )
            ],
            controller: _tabController,
          ),
        )
      ],
    );
  }

  Widget detilsWidget() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Anno fondazione: ", style: AppTheme.theme.textTheme.headline2,),
              Text(widget.costruttore.annoFondazione, style: AppTheme.theme.textTheme.headline1)
            ],
          ),

          Row(
            children: [
              Text("Nazione: ", style: AppTheme.theme.textTheme.headline2),
              Text(widget.costruttore.nazione, style: AppTheme.theme.textTheme.headline1)
            ],
          )
        ],
      ),
    );
  }

  Widget titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(widget.costruttore.nome, style: AppTheme.theme.textTheme.headline3,)),
        Image.asset(widget.costruttore.logo, width: 100,),
      ]
    );
  }
}