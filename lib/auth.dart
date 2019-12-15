import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'database_process.dart';


abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser(); 
  Future<void> signOut();
}

class Auth implements BaseAuth{
  Auth({this.db});
  final  BaseDatabase db;
  final  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> signInWithEmailAndPassword(String email, String password) async{
        AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email,password: password);
        FirebaseUser user = result.user;    
        return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async{
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email,password: password);
    FirebaseUser user = result.user;  
    db.insertUserData(email, password, user.uid);
    return user.uid;
  }

  @override
  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();   
    return user.uid;
  }

  @override
  Future<void> signOut() async{
    return _firebaseAuth.signOut();
  }

}