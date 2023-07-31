import 'package:chatapp/helper/helperFunc.dart';
import 'package:chatapp/services/DatabaseSevice.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  Future login( email, password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password))
          .user!;
      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future register(fName, email, password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      await DatabaseService(uid: user.uid).updateUserData(fName, email);
      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoginState(false);
      await HelperFunctions.saveUserEmail("");
      await HelperFunctions.saveUserName("");
      await firebaseAuth.signOut();
    } catch (e) {}
  }
}
