import 'package:firebase_app/todos.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'DataTableFirestore.dart';
import 'DatabseExample.dart';
import 'main.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xFF28292E),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF28292E),
          title: Text("Firestore Crud Operations " , style: TextStyle(color:Colors.white),),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.exit_to_app , color: Colors.white,size: 20), onPressed:(){
                  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                              );
            })
          ],

        ),

      body: GridLayout() ,
    );
  }
}

class GridLayout extends StatefulWidget {
  GridLayout({Key key}) : super(key: key);

  @override
  _GridLayoutState createState() => _GridLayoutState();
}

class _GridLayoutState extends State<GridLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: [
        SizedBox(height:140),

         InkWell(

           onTap: (){
                  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => D()),
                              );
           },
                    child: Card(
                      color: Colors.purpleAccent,
                     elevation: 20,
                child:
                Container(
                    padding:EdgeInsets.all(40),

                    child:new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Center(child:Text("Firestore DB",style: TextStyle(fontSize:30,fontWeight:FontWeight.w900,color : Colors.white),)),

                          Center(child:Text("Crud Operations ListView ",style: TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w900))),

                        ]
                    )
                )
            ),
         ),


          InkWell(

           onTap: (){
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => D1()),
                              );
           },
                    child: Card(
                      color: Colors.grey,
                     elevation: 20,
                child:
                Container(
                    padding:EdgeInsets.all(40),

                    child:new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Center(child:Text("Firestore DB",style: TextStyle(fontSize:30,fontWeight:FontWeight.w900,color : Colors.white),)),

                          Center(child:Text("Crud Operations Data Table",style: TextStyle(color: Colors.white,fontSize:22,fontWeight:FontWeight.w900))),

                        ]
                    )
                )
            ),
         ),

          InkWell(

           onTap: (){
                  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Todos()),
                              );
           },
                    child: Card(
                      color: Colors.purpleAccent,
                     elevation: 20,
                child:
                Container(
                    padding:EdgeInsets.all(40),

                    child:new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                          Center(child:Text("Firestore DB",style: TextStyle(fontSize:30,fontWeight:FontWeight.w900,color : Colors.white),)),

                          Center(child:Text("TodoList Insert-Delete ",style: TextStyle(color: Colors.white, fontSize:22,fontWeight:FontWeight.w900))),

                        ]
                    )
                )
            ),
         ),


      ]
        )
      );
    
  }
}