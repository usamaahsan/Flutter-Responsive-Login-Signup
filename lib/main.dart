import 'package:flutter/material.dart';
import 'package:materialloginsignup/styles/themeData.dart';
import 'package:materialloginsignup/views/auth/AuthView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Login and Signup',
      theme: Styles.themeData(),
      home: const AuthView()
    );
  }
}
