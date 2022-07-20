import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/nav_screen.dart';
import './pages/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ?
    const CupertinoApp(
      home: NavScreen(),
    )
      :
    const MaterialApp(
      home: TabScreen(),
    );
  }
}

