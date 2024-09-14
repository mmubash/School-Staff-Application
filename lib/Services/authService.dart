import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_staff/models/userModel.dart';
class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? userFromFirebase(User? user) {
    return user != null ? UserModel(email: user.email) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(userFromFirebase);
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createUserWithEmailAndPassword(String fName, String lName,
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await FirebaseFirestore.instance.collection('user').doc(user?.uid).set({
        'firstName': fName,
        'lastName': lName,
        'email': email,
      });
      return userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return 'Error: ${e.toString()}';
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Future <String?> getName() async {
  //   final firebaseUser= await FirebaseAuth.instance.currentUser;
  //   if(firebaseUser!=null){
  //     final CollectionReference users = FirebaseFirestore.instance.collection('user');
  //     final String? uid = _auth.currentUser?.uid;
  //     final result =await users.doc(uid).get();
  //     return result.data()?['displayName'];
  //   }
  // }
}