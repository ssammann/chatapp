import 'package:chatapp/services/DatabaseSevice.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
}
