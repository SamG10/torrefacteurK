import 'package:flutter/cupertino.dart';
import 'package:torrefacteurk/auth.dart';
import 'package:torrefacteurk/views/screens/authenticationPage.dart';
import 'package:torrefacteurk/views/screens/homePage.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges, builder: (context, snapshot) {
          if(snapshot.hasData) {
            return HomePage();
          } else {
            return AuthenticationPage();
          }
    });
  }
}
