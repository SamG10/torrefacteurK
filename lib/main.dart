import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:torrefacteurk/firebase_options.dart';
import 'package:torrefacteurk/views/widgets/widgetTree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torrefacteur K',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.brown,
      ),
      home: const WidgetTree(),
    );
  }
}