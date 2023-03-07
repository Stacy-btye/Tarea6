import 'package:flutter/material.dart';
import 'package:tarea6/portada.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String portada = Portada.routeName;

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
      },
      home: Portada(),
    );
  }
}
