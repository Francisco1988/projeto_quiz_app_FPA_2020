import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/models/user.dart';
class AuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBaseUser(FirebaseUser user){
    return user!= null ? User(uid: user.uid) : null;
  }
  Future signInEmailAndPass(String email, String senha) async{
    try{
      AuthResult authResult = await _auth.signInWithEmailAndPassword
        (email: email, password: senha);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFireBaseUser (firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String senha) async{

    try{
      AuthResult authResult = await _auth.createUserWithEmailAndPassword
        (email: email, password: senha);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFireBaseUser (firebaseUser);
    }catch (e){
      print(e.toString());
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
      }
   catch(e){
      print(e.toString());
      return null;
    }
  }

}