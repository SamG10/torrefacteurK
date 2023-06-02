import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class FieldService {
  createField(data, userId) async {
    if (FirebaseFirestore.instance != null) {
      DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

      await userRef.update({
        'fields': FieldValue.arrayUnion([data]),
      });
    } else {
      print("connexion à firestore échoué");
    }
  }
}
