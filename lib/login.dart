import 'package:firebase_app/todos.dart';
import 'package:firebase_app/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_app/authprovider.dart';

import 'DatabseExample.dart';
import 'MainPage.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF28292E),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF28292E),

        ),
        body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController _emailController;
  TextEditingController _passwordController;
@override
  void initState() { 
  
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }


  @override
  Widget build(BuildContext context) {
    return
    
     ListView(
            children:[Container(
        padding: EdgeInsets.only(top:50 , left:20 , right: 20),
         child:Column(
           children:[
             Text("Login" , style:TextStyle(fontSize:32.0  , fontWeight: FontWeight.w600, color:Colors.white)),
              SizedBox(height:100),

             TextField(
               controller: _emailController,
                  style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.mail , color:Colors.white),
            labelText: 'Your Email',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: Colors.grey[500],
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[500],
                width: 2,  
              ),
            ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,  
              ),)
                  ),
          
               ),


            SizedBox(height:20),



             TextField(
               controller: _passwordController,
               obscureText: true,
                  style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.vpn_key , color:Colors.white),
            labelText: 'Your Password',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(
                color: Colors.grey[500],
                width: 2,  
              ),
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[500],
                width: 2,  
              ),
            ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,  
              ),)
                  ),
          
               ),
               
               SizedBox(height:60),

        Container(
          width: double.infinity,
          child: TextButton(
                    
                    onPressed: () async{

                        if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                    Fluttertoast.showToast(
                    msg: "Please fill the two feilds !! ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 13.0
                );
                    print("Email and password cannot be empty");
                    return;
                  }
                  bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                  
                  if(!res) {
                    print("Login failed");
                  Fluttertoast.showToast(
                    msg: "Email or password incorrect :(",
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
                              MaterialPageRoute(builder: (context) => MainPage()),
                              );

                  }
                    

                         
                    },
                     child: Text("Login" , style: TextStyle(fontSize:21.0 ,color:Colors.white, fontWeight:FontWeight.w700),) , 
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

                  SizedBox(height:25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("You Dont't Have An Account ? " ,style:TextStyle(color: Colors.white , fontWeight:FontWeight.w400)),
                                
                                InkWell(
                                  onTap: (){
                                Navigator.push(
                                   context,
                                 MaterialPageRoute(builder: (context) => Signup()),
                                                          );

                                  },
                                child: Text("Register Here! " ,
                               
                                  style:TextStyle(color: Colors.blueAccent ,   fontWeight:FontWeight.w400)),
                                ),
                                
                    ],
                  )
                        
             ]
         )
    ),]
     );
  }
}