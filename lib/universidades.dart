import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tarea6/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Universidades extends StatefulWidget {
  const Universidades({Key? key}) : super(key: key);

  static const String routeName = '/universidades';

  @override
  _UniversidadesState createState() => _UniversidadesState();
}

class _UniversidadesState extends State<Universidades> {
  final TextEditingController _countryController = TextEditingController();
  List<dynamic> _universities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
      ),
      drawer: const DrawerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _countryController,
              decoration: const InputDecoration(
                labelText: 'Country',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final String country = _countryController.text;
              final response = await http.get(
                Uri.parse('http://universities.hipolabs.com/search?country=$country'),
              );
              final data = jsonDecode(response.body);
              setState(() {
                _universities = data;
              });
            },
            child: const Text('Send'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _universities.length,
              itemBuilder: (BuildContext context, int index) {
                final university = _universities[index];
                final webPages = university['webPages'] as List<dynamic>?;
                return GestureDetector(
                  onTap: () {
                    if (webPages != null && webPages.isNotEmpty) {
                      launchURL(webPages[0] as String);
                    }
                  },
                  child: Ink(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(university['name']),
                      subtitle: Text(university['country']),
                      trailing: Text(university['domains'].join(', ')),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}