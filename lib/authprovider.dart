import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthProvider {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signInWithEmail(String email, String password) async{
    try {
  
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email,password: password);
      User user = result.user;
      if(user != null)
      { Fluttertoast.showToast(
                    msg: "Login succefully :)",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 13.0
                );
      return true;}
      else   return false;
    } catch (e) {
      print(e.message);
      return false;
    }
  }
  Future<bool> createUserWithemail(String email, String password) async{
    try {
      
  
            UserCredential result = await _auth.createUserWithEmailAndPassword(email: email,password: password);
      User user = result.user;
      if(user != null)
      { Fluttertoast.showToast(
                    msg: "SignUp succefully :)",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    //backgroundColor: Colors.red,
                    //textColor: Colors.white,
                    fontSize: 13.0
                );
      return true;}
      else
      return false;
    } catch (e) {
      print(e.message);
      return false;
    }
  }
  

 Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if(account == null )
        return false;
      UserCredential res = await _auth.signInWithCredential(GoogleAuthProvider.credential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if(res.user == null)
        return false;
      return true;
    } catch (e) {
      print(e.message);
      print("Error logging with google");
      return false;
    }
  }



  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("error logging out");
    }
  }

 
}
//FirebaseAuth.instance.createUserWithEmailAndPassword(email: <your email>, password: <your password>)