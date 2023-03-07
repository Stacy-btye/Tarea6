import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Clima extends StatefulWidget {
  const Clima({Key? key}) : super(key: key);

  static const String routeName = '/clima';

  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  late String _temperatura = '';
  late String _descripcion = '';
  late String _icono = '';

  Future<void> _obtenerClima() async {
    final respuesta = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=Santo%20Domingo,DO&appid=f52b1f9994c90e38e02fdcc87da5f318&units=metric'),
    );

    final datos = jsonDecode(respuesta.body);

    setState(() {
      _temperatura = '${datos['main']['temp']}°C';
      _descripcion = datos['weather'][0]['description'];
      _icono = 'https://openweathermap.org/img/w/${datos['weather'][0]['icon']}.png';
    });
  }

  @override
  void initState() {
    super.initState();
    _obtenerClima();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima'),
      ),
      drawer: const DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              _icono,
              scale: 1.5,
            ),
            const SizedBox(height: 10),
            Text(
              _temperatura,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              _descripcion,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}