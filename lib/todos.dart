
import 'package:firebase_app/DatabseExample.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  Screen1({Key key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  List todos = List();

      void initState(){
          super.initState();
          todos.add("Item 1");
          todos.add("Item 2");
          todos.add("Item 3");
           
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
      onPressed: () {
       
      },
      child: 
      
       Icon(Icons.add , size: 50,),
      backgroundColor: Colors.purpleAccent,
    ),
      backgroundColor:  Color(0xFF28292E),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Your Todo List" , style: TextStyle(color:Colors.white),),
          elevation: 0.0,
          backgroundColor: Color(0xFF28292E),

        ),
        body: ListView(
      children: [

          Card(
            
             color: Colors.transparent,
            elevation: 10.0,
            child: ListTile(
              
              title:Text("Todos 1 " ,style:TextStyle(color:Colors.white , fontSize:20.0)),
              trailing: Icon(Icons.delete ,  size: 35, color: Colors.red,),


          ) ,
            ),

                Card(
            
             color: Colors.transparent,
            elevation: 10.0,
            child: ListTile(
              
              title:Text("Todos 2 " ,style:TextStyle(color:Colors.white , fontSize:20.0)),
                            trailing: Icon(Icons.delete ,  size: 35, color: Colors.red,),


          ) ,
            ),
             Card(
            
             color: Colors.transparent,
            elevation: 10.0,
            child: ListTile(
              
              title:Text("Todos 3 " ,style:TextStyle(color:Colors.white , fontSize:20.0)),
                            trailing: Icon(Icons.delete ,  size: 35, color: Colors.red,),


          ) ,
            ),
             Card(
            
             color: Colors.transparent,
            elevation: 10.0,
            child: ListTile(
              
              title:Text("Todos 4 " ,style:TextStyle(color:Colors.white , fontSize:20.0)),
                            trailing: Icon(Icons.delete ,  size: 35, color: Colors.red,),


          ) ,
            ),
            
      ],
    )


    );
  }
}