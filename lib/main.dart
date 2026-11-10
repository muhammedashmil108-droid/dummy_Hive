import 'package:flutter/material.dart';
import 'home.dart';
void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      title: 'StudentApp',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}