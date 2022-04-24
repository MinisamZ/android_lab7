import 'package:android_lab7/pages/register_form_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Register Form",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity:  VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterFormPage(),
    );
  }
}
