import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteurk/services/userService.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          var userData = snapshot.data!.data();
          print("userData");
          print(userData);
          if (userData != null && userData is Map<String, dynamic>) {
            var firstName = userData['firstname'];
            var coins = userData['coins'];
            return Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80'),
                    ),
                  Text(
                    firstName ?? '', // Affiche firstName s'il n'est pas null, sinon affiche une chaîne vide
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                    Text("$coins DeeVee",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent)),
                  ],
                ),
              ),
            );
          }
        }
        // S'il n'y a pas de données ou si userData n'est pas de type Map<String, dynamic>
        // vous pouvez afficher un widget Text alternatif ou tout autre widget pour gérer ces cas.
        return Text('Loading...');
      },
    );
  }
}
