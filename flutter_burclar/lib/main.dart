// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_listesi.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: BurcListesi(),
    );
  }
}
