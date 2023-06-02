import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future createUser(data, userId) async {
    if(FirebaseFirestore.instance != null) {
      await FirebaseFirestore.instance.collection("users").doc(userId).set(
          data);
    } else {
      print("connexion à firestore échoué");
    }
  }

  Future getUserFirstname() async {
    User? user = FirebaseAuth.instance.currentUser;

    if(user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
      if(snapshot.exists) {
        var userData = snapshot.data();
        if(userData != null && userData is Map<String, dynamic>) {
          return userData['firstname'].toString();
        }
      } else {
        print('snapshot not exist');
      }
    }
  }
}