import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholar_chat/Screens/Chat_page.dart';
import 'package:scholar_chat/Screens/Home_Page.dart';
import 'package:scholar_chat/Screens/Reguster_Page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'ChatPage' : (context) => ChatPage(), 
        'RegusterPage' : (context) => RegusterPage(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
