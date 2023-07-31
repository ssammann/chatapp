import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(fName, email, password) async {
    try {

      User user= (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

    } catch (e) {


    }
  }
}
