import 'package:flutter/material.dart';
import 'main.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Stacy"),
            accountEmail: Text("202010229@itla.edu.do"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/Me.jpg"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Portada'),
            onTap: () => Navigator.pushReplacementNamed(context, MyApp.portada),
          ),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('Genero'),
            onTap: () => Navigator.pushReplacementNamed(context, MyApp.genero),
          ),
          ListTile(
            leading: const Icon(Icons.numbers),
            title: const Text('Edad'),
            onTap: () => Navigator.pushReplacementNamed(context, MyApp.edad),
          ),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text('Universidades'),
            onTap: () => Navigator.pushReplacementNamed(context, MyApp.universidades),
          ),
          ListTile(
            leading: const Icon(Icons.shower),
            title: const Text('Clima'),
            onTap: () => Navigator.pushReplacementNamed(context, MyApp.clima),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Acerca de'),
            onTap: () => Navigator.pushReplacementNamed(context, MyApp.acerca),
          ),
        ],
      ),
    );
  }
}
