import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteurk/auth.dart';
import 'package:torrefacteurk/views/screens/authenticationPage.dart';
import 'package:torrefacteurk/views/screens/test.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  final databaseReference = FirebaseDatabase.instance.ref();

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Image.asset(
      "assets/logo.png",
      width: 150,
    );
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: new IconButton(
        icon: new Icon(
          Icons.logout,
          color: Colors.black54,
          size: 30,
        ),
        onPressed: () {
          signOut();
        },
      ),
    );
  }

  int _selectedTab = 0;

  final List _pages = [
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4")
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        actions: [_signOutButton()],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        onTap: (index) => {_changeTab(index)},
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black54, size: 40), label: 'Game', activeIcon: Icon(Icons.add, color: Colors.red, size: 40)),
          BottomNavigationBarItem(
              icon: Icon(Icons.print, color: Colors.black54, size: 40,), label: 'Game', activeIcon: Icon(Icons.print, color: Colors.red, size: 40)),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc, color: Colors.black54, size: 40,), label: 'Game', activeIcon: Icon(Icons.abc, color: Colors.red, size: 40)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded, color: Colors.black54, size: 40,),
              label: 'Game', activeIcon: Icon(Icons.account_tree_rounded, color: Colors.red, size: 40)),
        ],
      ),
    );
  }
}
