import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';

class Acerca extends StatelessWidget {

  static const String routeName = '/acerca';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contáctame"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('Stacy Morales'),
              ),
              Image.asset(
                'assets/Me.jpg',
                height: 450,
                width: 450,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Matrícula: 2020-10229                                                                    '
                      'Correo: 202010229@itla.edu.do ',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}