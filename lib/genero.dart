import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tarea6/drawer.dart';

class Genero extends StatefulWidget {
  const Genero({Key? key});

  static const String routeName = '/genero';

  @override
  _GeneroState createState() => _GeneroState();
}

class _GeneroState extends State<Genero> {
  final TextEditingController _nameController = TextEditingController();
  String? _gender;
  bool _isMale = false;
  bool _isFemale = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _getGender(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    final data = json.decode(response.body);
    final gender = data['gender'];
    setState(() {
      _gender = gender;
      _isMale = gender == 'male';
      _isFemale = gender == 'female';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Genero"),
      ),
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Ingrese su nombre',
              contentPadding: EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _getGender(_nameController.text);
            },
            child: const Text('Guardar'),
          ),
          if (_gender != null) ...[
            if (_isMale)
              Row(
                children: [
                  Image.asset('assets/boy.jpg', width: 250),
                  const SizedBox(width: 30),
                  const Text('Usted es hombre'),
                ],
              ),
            if (_isFemale)
              Row(
                children: [
                  Image.asset('assets/girl.jpg', width: 250),
                  const SizedBox(width: 30),
                  const Text('Usted es mujer'),
                ],
              ),
          ],
        ],
      ),
    );
  }
}