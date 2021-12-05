
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_management/Screens/login.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  //setupServices();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank-Management',
      home: Login(),
    );
  }
}