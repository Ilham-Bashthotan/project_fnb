import 'package:flutter/material.dart';
import 'package:project_fnb/login.dart';
import 'package:project_fnb/menu.dart';
import 'package:project_fnb/tes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Tes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
