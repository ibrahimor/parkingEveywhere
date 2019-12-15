import 'package:flutter/material.dart';
import 'auth.dart';
import 'root_page.dart';
import 'database_process.dart';

void main(){
  runApp(MyApp());
} 

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth(db: new Database()),),
    );
  }
}