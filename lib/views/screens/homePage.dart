import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteurk/auth.dart';
import 'package:torrefacteurk/views/screens/gamePage.dart';
import 'package:torrefacteurk/views/screens/rankingPage.dart';
import 'package:torrefacteurk/views/screens/shopPage.dart';
import 'package:torrefacteurk/views/screens/stockPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  final databaseReference = FirebaseDatabase.instance.ref();

  int _selectedTab = 0;

  List _pages = [
    GamePage(),
    ShopPage(),
    RankingPage(),
    StockPage()
  ];

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Image.asset(
      "assets/logo.png",
      width: 150,
    );
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
              icon: ImageIcon(AssetImage('assets/game.png'), size: 40), label: 'Game'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/shop.png'), size: 40), label: 'Game'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/ranking.png'), size: 40), label: 'Game'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/stock.png'), size: 40), label: 'Game'),
        ],
      ),
    );
  }
}
