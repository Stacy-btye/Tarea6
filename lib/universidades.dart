import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';

class Universidades extends StatelessWidget {
  const Universidades({super.key});

  static const String routeName = '/universidades';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Universidades"),
      ),
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          Image.asset('assets/caja.png'),
        ],
      ),
    );
  }
}