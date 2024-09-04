import 'package:flutter/cupertino.dart';
import 'package:school_staff/Services/authService.dart';

import '../models/userModel.dart';

class AuthController with ChangeNotifier{
 final AuthService _authService =AuthService();
 bool loading =false;
 UserModel? _user;
 UserModel? get user => _user;
 bool get _loading => loading;
 isloading(bool value){
   loading = value;
   notifyListeners();
 }
Stream<UserModel?> get userStream=> _authService.user;
Future<void> signIn(String email ,String password)async{
   _user=await _authService.signInWithEmailAndPassword(email, password);
   notifyListeners();
}
 Future signUp(String fName, String lName, String email, String password) async {
    await _authService.createUserWithEmailAndPassword(fName, lName, email, password);
     _user = UserModel(fName: fName, lName: lName, email: email);
   notifyListeners();

 }

Future<void>signOut()async{
  await _authService.signOut();
  _user=null;
  notifyListeners();
}
}