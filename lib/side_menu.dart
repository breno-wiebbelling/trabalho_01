import 'package:flutter/material.dart';
import './login_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          const ListTile(
            title: Text('Item 1'),
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () =>
                Navigator.popAndPushNamed(context, LoginScreen.routeName),
          ),
        ],
      ),
    );
  }
}
