import 'package:flutter/material.dart';
import 'package:tarea6/portada.dart';
import 'package:tarea6/universidades.dart';

import 'acerca.dart';
import 'clima.dart';
import 'edad.dart';
import 'genero.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String portada = Portada.routeName;
  static const String genero = Genero.routeName;
  static const String edad = Edad.routeName;
  static const String universidades = Universidades.routeName;
  static const String clima = Clima.routeName;
  static const String acerca = Acerca.routeName;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        portada: (context) => Portada(),
        genero: (context) => Genero(),
        edad: (context) => Edad(),
        universidades: (context) => Universidades(),
        clima: (context) => Clima(),
        acerca: (context) => Acerca(),

      },
      home: Portada(),
    );
  }
}
