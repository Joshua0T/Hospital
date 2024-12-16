import 'package:flutter/material.dart';
import 'package:hospital/screen/inicio.dart';



void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override

Widget build (BuildContext context){
  return const MaterialApp(
    home: Scaffold(
      body: Inicio(),
    ),
  );
}

}