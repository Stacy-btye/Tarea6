import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';

class Genero extends StatelessWidget {
  const Genero({super.key});

  static const String routeName = '/genero';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Genero"),
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