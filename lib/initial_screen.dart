import 'package:flutter/material.dart';
import './login_screen.dart';
import './side_menu.dart';

class InitialScreen extends StatelessWidget {
  static const routeName = "./";

  const InitialScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela inicial")),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => _logout(context), child: const Text("Sair")),
        ],
      ),
    );
  }
}
