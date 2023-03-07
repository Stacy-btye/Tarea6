import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';

class Clima extends StatelessWidget {
  const Clima({super.key});

  static const String routeName = '/clima';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clima"),
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