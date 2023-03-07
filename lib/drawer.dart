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
        ],
      ),
    );
  }
}
