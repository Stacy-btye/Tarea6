import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';

class Edad extends StatelessWidget {
  const Edad({super.key});

  static const String routeName = '/edad';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edad"),
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