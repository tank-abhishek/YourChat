import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourchat/screens/Calls.dart';
import 'package:yourchat/screens/Chats.dart';
import 'package:yourchat/screens/People.dart';
import 'package:yourchat/screens/Settings.dart';
//import 'package:yourchat/screens/login/edit_number.dart';
import 'package:yourchat/screens/login/hello.dart';
//import 'package:yourchat/screens/login/select_country.dart';
//import 'package:yourchat/screens/login/user_name.dart';
//import 'package:yourchat/screens/login/verify_number.dart';
const bool USE_EMULATOR = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if(USE_EMULATOR){
    _connectToFirebaserEmulator();
  }
  runApp(const MyApp());
}

Future _connectToFirebaserEmulator() async {
  final fireStorePort = "8085";
  final authPort = "9099";
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
    host: "$localHost:$fireStorePort",
    sslEnabled: false,
    persistenceEnabled: false
  );
  await FirebaseAuth.instance.useEmulator("http://$localHost:$authPort");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Hello(),
      theme: CupertinoThemeData(brightness: Brightness.light, primaryColor: Color(0xff145C9E)),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var screens = [Chats(), Calls(), People(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    //todo
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(CupertinoIcons.phone),
          ),
          BottomNavigationBarItem(
            label: "People",
            icon: Icon(CupertinoIcons.person_alt_circle),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(CupertinoIcons.settings_solid),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return screens[index];
      },
    ));
  }
}
