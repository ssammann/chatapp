

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String? uid;

  DatabaseService({this.uid});

  CollectionReference userCR = FirebaseFirestore.instance.collection("users");
  CollectionReference groupsCR =
      FirebaseFirestore.instance.collection("groups");

  updateUserData(String fName, String email) async {
    return await userCR.doc(uid).set({
      "fullName": fName,
      "email": email,
      "groups":[],
      "profilePic":""
    });
  }
}
