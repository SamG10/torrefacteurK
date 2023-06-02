import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteurk/auth.dart';
import 'package:torrefacteurk/services/userService.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPseudo = TextEditingController();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();

  Future signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      UserCredential? userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text);

      if (userCredential != null) {
        String userId = userCredential.user!.uid;

        createUserInDatabase(
            _controllerFirstName.text,
            _controllerLastName.text,
            10,
            _controllerPseudo.text,
            _controllerEmail.text,
            _controllerPassword.text,
            userId);
      } else {
        print("Erreur lors de la création du user");
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return Image.asset("assets/logo.png");
  }

  Widget _entryField(String title, TextEditingController controller) {
    if (title == "password") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: title,
          ),
        ),
      );
    }
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

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : "$errorMessage");
  }

  Widget _submitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(
          isLogin ? 'Login' : 'Register',
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? "Register" : "Login"));
  }

  Widget _formAuth() {
    if (isLogin) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _entryField('email', _controllerEmail),
          _entryField('password', _controllerPassword),
          _errorMessage(),
          _submitButton(),
          _loginOrRegisterButton()
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _entryField('email', _controllerEmail),
          _entryField('password', _controllerPassword),
          _entryField('pseudo', _controllerPseudo),
          _entryField('firstName', _controllerFirstName),
          _entryField('lastName', _controllerLastName),
          _errorMessage(),
          _submitButton(),
          _loginOrRegisterButton()
        ],
      );
    }
  }

  createUserInDatabase(
      firstname, lastname, coins, pseudo, email, password, userId) async {
    final data = {
      "userId": userId,
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
      "pseudo": pseudo,
      "coins": coins,
      "fields": ["fields n°1"]
    };

    await UserService().createUser(data, userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _title(),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: _formAuth()),
    );
  }
}
