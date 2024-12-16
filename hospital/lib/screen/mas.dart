import 'package:flutter/material.dart';

class Mas extends StatelessWidget {
  const Mas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mas'),
      ),
      body: Center(
        child: Text('Bienvenido',
        style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),),
      ),
    );
  }
}