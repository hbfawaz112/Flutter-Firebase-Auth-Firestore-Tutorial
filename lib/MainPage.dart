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
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        TextButton(
            onPressed: () {
              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => D()),
                              );

            },
            child: Column(
              children: [
                Text(
                  'Firestore DB\nCrud ListView',
                ),
                SizedBox(height: 30),
              ],
            ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purpleAccent,
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
            SizedBox(height: 40,),
            TextButton(
            onPressed: () {

              
              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => D1()),
                              );
                              

            },
            child: 
              Column(
                children: [
                  Text(
                  'Firestore DB\nCrud DataTable',
                 ),
                  SizedBox(height: 30),
                ],
              ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.grey,
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
            SizedBox(height: 40,),
            TextButton(
            onPressed: () {
              
              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Todos()),
                              );
                              
            },
            child:
             Column(
               children: [
                 Text(
                  'Todo List\nFirestore DB\nCrud',
            ),
             SizedBox(height: 30),
               ],
             ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purpleAccent,
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
            
      ],)
    );
  }
}