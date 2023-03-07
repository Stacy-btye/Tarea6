import 'package:flutter/material.dart';
import 'package:tarea6/drawer.dart';

class Edad extends StatefulWidget {
  const Edad({Key? key});

  static const String routeName = '/edad';

  @override
  _EdadState createState() => _EdadState();
}

class _EdadState extends State<Edad> {
  final _formKey = GlobalKey<FormState>();
  int? _edad;
  String? _mensaje;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edad"),
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ingrese su edad',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una edad';
                  }
                  final edad = int.tryParse(value);
                  if (edad == null || edad <= 0) {
                    return 'Ingrese una edad válida';
                  }
                  return null;
                },
                onSaved: (value) {
                  _edad = int.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (_edad! < 18) {
                      _mensaje = 'Eres joven';
                    } else if (_edad! >= 18 && _edad! < 65) {
                      _mensaje = 'Eres adulto';
                    } else {
                      _mensaje = 'Eres anciano';
                    }

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Mensaje'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              _edad! < 18
                                  ? 'assets/joven.webp'
                                  : _edad! >= 18 && _edad! < 65
                                  ? 'assets/adulta.jpg'
                                  : 'assets/anciano.jpg',
                            ),
                            const SizedBox(height: 16),
                            Text(_mensaje!),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}