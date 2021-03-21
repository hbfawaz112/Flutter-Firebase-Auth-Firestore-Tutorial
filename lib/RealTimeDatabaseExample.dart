import 'package:firebase_app/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class D2 extends StatefulWidget {
  D2({Key key}) : super(key: key);

  @override
  _D2State createState() => _D2State();
}

class _D2State extends State<D2> {

  TextEditingController t1 = new TextEditingController();

  var _firebaseRef = FirebaseDatabase().reference().child('movies');

  sendData(){
    _firebaseRef.push().set({
        "movie": t1.text,
    });
    t1.clear();
  }
  deleteMessage(key) {
    _firebaseRef.child(key).remove();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:  Color(0xFF28292E),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF28292E),
          title: Text("RealTime Database Crud Operations " , style: TextStyle(color:Colors.white),),
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
      body: SingleChildScrollView(
              child: Column(
            children:[
                
                 Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: t1,
                        style: TextStyle(color: Colors.white),

                        decoration:InputDecoration(
                          
                          enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      ),
                          labelText: "Your Favorite Movie:",fillColor: Colors.white,
                          labelStyle: TextStyle(color:Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purpleAccent , width: 2.0)
                          )
                        ),
                        onChanged: (String ID){
                            
                        },
                      ),
                    ),

                    Center(child:
                        TextButton(
                              onPressed: () { 
                                    sendData();
                               },
                              child: Text("Add your movie" , style: TextStyle( color:Colors.white,fontSize:20,fontWeight:FontWeight.w900),) ,
                              style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.white)
                                )),
                           backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
                        ),
                        ),
                    ),
                    SizedBox(height:20),


                    StreamBuilder(
                    stream: _firebaseRef.onValue,
                    builder: (context, snap) {

            if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null) {

                Map data = snap.data.snapshot.value;
                List item = [];

                data.forEach((index, data) => item.add({"key": index, ...data}));

                return 
                
                ListView.builder(
                             shrinkWrap: true,
                       
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                        return Card(
            
             
            elevation: 10.0,
            child: ListTile(
              
              title:Text( item[index]['movie'] ,style:TextStyle(color:Colors.black , fontSize:20.0)),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 35.0,
                  color: Colors.red[900],
                ),
                onPressed: () {
                   deleteMessage(item[index]['key']);
                },
              ),
                            
                          

          ) ,
            );
                        },
                    );
            }
            else
                return Text("No data");
    },
)

                   

          ]),
      ),
      
    );
  }
}