
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/DatabseExample.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  Todos({Key key}) : super(key: key);

  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {



String input;
    


      void createTodo()async{

          QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('Todos').get();
          List<DocumentSnapshot> _myDocCount = _myDoc.docs;
        int n = _myDocCount.length;
        n=n+1;
          print(n);
  FirebaseFirestore.instance.collection("Todos").doc(n.toString()).set({'Todo':input});

        
      }


    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
      onPressed: () {
       
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(10),
                    ),
                    title: Text("Add TOOD"),
                    content: TextField(
                      onChanged: (String value){
                        input=value;
                      },
                    ),
                    actions: [
                      FlatButton(
                        onPressed: (){
                          createTodo();
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"),
                      )
                    ],
                );
              }
            );

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
        body: StreamBuilder<QuerySnapshot>(
        // <2> Pass `Stream<QuerySnapshot>` to stream
        stream: FirebaseFirestore.instance.collection('Todos').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            //final List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView.builder(
                        shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index){
               DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                          return Card(
            
             color: Colors.transparent,
            elevation: 10.0,
            child: ListTile(
              
              title:Text(documentSnapshot["Todo"] ,style:TextStyle(color:Colors.white , fontSize:20.0)),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 35.0,
                  color: Colors.red[900],
                ),
                onPressed: () {
                   DocumentReference documentReference = FirebaseFirestore.instance.
                                          collection("Todos").doc((index+1).toString());

              documentReference.delete().whenComplete(() => {
                print('deleted')
              });  
                },
              ),
                            
                          

          ) ,
            );
              }
            );
          } else if (snapshot.hasError) {
            return Text('ERROR');
          }
        })


    );
  }
}