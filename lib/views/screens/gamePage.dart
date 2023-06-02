import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteurk/auth.dart';
import 'package:torrefacteurk/services/fieldService.dart';
import 'package:torrefacteurk/services/userService.dart';
import 'package:torrefacteurk/views/widgets/kafeCardWidget.dart';
import 'package:torrefacteurk/views/widgets/userCardWidget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference userRef = FirebaseDatabase.instance.ref();

  final TextEditingController _controllerField = TextEditingController();

  String? firstName;
  String dropDownValue = '';

  @override
  void initState() {
    super.initState();
    UserService().getUserFirstname();
  }

  Widget DropDownButtonCustom() {
    User? user = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          var userData = snapshot.data!.data();
          if (userData != null && userData is Map<String, dynamic>) {
            var fields = userData['fields'];
            if (fields != null && fields is List<dynamic>) {
              List<String> fieldValues = fields.cast<String>();
              var dropDownValue = fieldValues;

              return DropdownButton<String>(
                value: dropDownValue.first,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.brown),
                underline: Container(
                  height: 2,
                  color: Colors.brown,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropDownValue.first = value!;
                  });
                },
                items:
                    fieldValues.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              );
            }
          }
        }
        return Text('Loading...');
      },
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: title,
        ),
      ),
    );
  }

  final User? user = Auth().currentUser;

  addField() async {
    final data = _controllerField.text;
    await FieldService().createField(data, user!.uid);
  }

  Widget _submitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF96520F)),
        onPressed: () {
          print("addFields");
          addField();
        },
        child: Text("create"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              UserCardWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DropDownButtonCustom(),
                  IconButton(
                    icon: Icon(Icons.add, size: 30),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          title: const Text('Add other field'),
                          content: new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Column(
                                  children: [
                                    _entryField("new field", _controllerField),
                                    _submitButton(),
                                  ],
                                ),
                              )
                            ],
                          ),
                          actions: <Widget>[
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, int index) {
                    return KafeCardWidget();
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
