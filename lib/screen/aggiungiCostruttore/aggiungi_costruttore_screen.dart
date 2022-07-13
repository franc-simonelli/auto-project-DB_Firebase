// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class AggiungiCostruttoreScreen extends StatelessWidget {
  const AggiungiCostruttoreScreen({ Key? key }) : super(key: key);

  static const String routeName = "/aggiungicostruttore";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE7ECEF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: buttonWidget(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                      BoxShadow(
                      blurRadius: 5,
                      offset: Offset(-3, -3),
                      // color: Colors.white,
                      color: Color.fromARGB(255, 43, 43, 43)
                    ),
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(5, 5),
                      // color: Color(0xFFA7A9AF)
                      color: Color.fromARGB(255, 10, 10, 10)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Color(0xFFE7ECEF),
                          color: Colors.grey.shade900,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(-3, -3),
                              // color: Colors.white,
                              color: Color.fromARGB(255, 43, 43, 43)
                            ),
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(5, 5),
                              // color: Color(0xFFA7A9AF)
                              color: Color.fromARGB(255, 10, 10, 10)
                            )
                          ]
                        ),
                        child: Center(
                          child: Icon(Icons.add_a_photo_outlined),
                        ),
                      ),
      
                    ),
      
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Color(0xFFE7ECEF),
                          color: Colors.grey.shade900,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              // color: Colors.white,
                              color: Color.fromARGB(255, 43, 43, 43)
                            ),
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(-5, -5),
                              // color: Color(0xFFA7A9AF)
                              color: Color.fromARGB(255, 10, 10, 10)
                            )
                          ]
                        ),
                        child: TextFormField(
                          
                          style: TextStyle(color: Colors.grey),
                          cursorColor: Colors.grey,
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Costruttore',
                            filled: true,
                            
                            
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Color(0xFFE7ECEF),
                          color: Colors.grey.shade900,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              // color: Colors.white,
                              color: Color.fromARGB(255, 43, 43, 43)
                            ),
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(-5, -5),
                              // color: Color(0xFFA7A9AF)
                              color: Color.fromARGB(255, 10, 10, 10)
                            )
                          ]
                        ),
                        child: TextFormField(
                          
                          style: TextStyle(color: Colors.grey),
                          cursorColor: Colors.grey,
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Nazione',
                            filled: true,
                            
                            
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Color(0xFFE7ECEF),
                          color: Colors.grey.shade900,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              // color: Colors.white,
                              color: Color.fromARGB(255, 43, 43, 43)
                            ),
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(-5, -5),
                              // color: Color(0xFFA7A9AF)
                              color: Color.fromARGB(255, 10, 10, 10)
                            )
                          ]
                        ),
                        child: TextFormField(
                          
                          style: TextStyle(color: Colors.grey),
                          cursorColor: Colors.grey,
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Descrizione',
                            filled: true,
                            
                            
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            )
          ] 
        ),
      )
  
       
    );
  }

  Widget buttonWidget() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: Color(0xFFE7ECEF),
        color: Colors.grey.shade900,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(-3, -3),
            // color: Colors.white,
            color: Color.fromARGB(255, 43, 43, 43)
          ),
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(5, 5),
            // color: Color(0xFFA7A9AF)
            color: Color.fromARGB(255, 10, 10, 10)
          )
        ]
      ),
      child: Center(
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}