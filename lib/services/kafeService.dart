import 'package:cloud_firestore/cloud_firestore.dart';

class KafeService {
  createKafePlan(data) async {
    if (FirebaseFirestore.instance != null) {



    } else {
      print("connexion à firestore échoué");
    }
  }
}
