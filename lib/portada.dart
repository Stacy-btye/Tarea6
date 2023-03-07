import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';

class Portada extends StatelessWidget {
  const Portada({super.key});

  static const String routeName = '/portada';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Portada"),
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