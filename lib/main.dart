import 'package:firebase_app/todos.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/login.dart';
import 'package:firebase_app/signup.dart';
  
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'DataTableFirestore.dart';
import 'DatabseExample.dart';
import 'MainPage.dart';
import 'authprovider.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Firebase tutorial',
      home:HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xFF28292E),
        body: Column(
          children: [
            
            Container(
              padding: EdgeInsets.only(top:100 , left: 30),
              child : Text("Welcome To      Firebase Tutorial." , style: TextStyle(fontSize: 45.0 , fontWeight: FontWeight.w900 , color: Colors.white),),
              
            ),
           
            SizedBox(height:220),

            Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
              child: TextButton(
                
                onPressed: ()=>{

                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          )

                },
                 child: Text("Login" , style: TextStyle(fontSize:21.0 ,color:Colors.white, fontWeight:FontWeight.w700),) , 
                 style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.white)
                        )),
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                 ),
            ) , 
             
             Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
              child: TextButton(
                
                onPressed: ()=>{

                   Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                          )

                },
                 child: Text("SingUp" , style: TextStyle(fontSize:21.0 ,color:Colors.white, fontWeight:FontWeight.w700),) , 
                 style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.white)
                        )),
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
                ),
                 ),
            ) ,

             Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
              child: TextButton(
                
                onPressed: ()async{

                      bool res = await AuthProvider().loginWithGoogle();
                           if(!res) {
                    print("signup failed");
                  Fluttertoast.showToast(
                    msg: "Sign Up Faild! :(",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 13.0
                );

                    }else{
                     Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => D()),
                              );

                  }

                },
                 child: Text("Google Sigin" , style: TextStyle(fontSize:21.0 ,color:Colors.white, fontWeight:FontWeight.w700),) , 
                 style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.white)
                        )),
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                 ),
            ) ,
            

          ],
        ),
        
      );
  }
}