import 'package:flutter/material.dart';
import 'package:ventas_app/pages/home_page.dart';
import 'package:ventas_app/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}