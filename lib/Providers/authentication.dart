import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
  dynamic errorMessage = '';
  dynamic get getErrorMessage => errorMessage;
  String uid;
  String get getUid => uid;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginIntoAccount(String email, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid);
      print('this is out uid => $getUid');
      notifyListeners();
    } catch (e) {
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'Usernot found';
          print(errorMessage);
          break;
        case 'wrong password':
          errorMessage = 'Oops wrong password';
          print(errorMessage);
      }
    }
  }

  Future createNewAccount(String email, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      uid = user.uid;
      sharedPreferences.setString('uid', uid);
      print('this is out uid  =>$getUid');
      notifyListeners();
    } catch (e) {
      switch (e.code) {
        case 'account-exist-with-diferent-creential':
          errorMessage = 'email already in use';
          print(errorMessage);
          break;
        case 'Iinvalid-email':
          errorMessage = 'sorry, invalid email';
          print(errorMessage);
      }
    }
  }
}
