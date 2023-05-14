import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './side_menu.dart';

class InitialScreen extends StatefulWidget {
  static const routeName = "./";

  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String? username;
  String? password;
  SharedPreferences? prefs;

  @override
  initState() {
    super.initState();

    _loadCredentials().then((result) => setState(() {}));
  }

  Future<void> _loadCredentials() async {
    prefs = await SharedPreferences.getInstance();
    username = prefs!.getString("username") ?? "";
    password = prefs!.getString("password") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela inicial")),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Username: $username'),
          Text('Senha:    $password'),
        ],
      ),
    );
  }
}
