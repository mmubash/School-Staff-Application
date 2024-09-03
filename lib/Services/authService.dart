import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_staff/models/userModel.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? _userFromFirebase(User? user){
    return user !=null? UserModel(uId:user.uid,email: user.email):null;
  }

  Stream<UserModel?> get user{
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future signInWithEmailAndPassword(String email, String password)async{
    try{
     UserCredential result= await _auth.signInWithEmailAndPassword(email:email,password:password);
     User? user=result.user;
     return _userFromFirebase(user);
    }
    catch(e){
      print (e.toString());
      return null;
    }
  }

  Future <String>createUserWithEmailAndPassword(String fName,String lName,String email,String password )async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email:email,password:password);
      User? user =result.user;
      await FirebaseFirestore.instance.collection('user').doc(user?.uid).set({
        'firstName':fName,
        'lastName':lName,
        'email':email,
      });
      return 'Sign up successful';
    }catch(e){
      print (e.toString());
      return'Error: ${e.toString()}';
    }
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }


}
