import 'package:flutter/material.dart';
import 'package:trabalho_1/drawers/side_menu.dart';
import 'package:trabalho_1/services/login_service.dart';

class InitialScreen extends StatefulWidget {
  static const routeName = "./";

  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String? _username;
  String? _password;

  final LoginService _loginService = LoginService();

  @override
  initState() {
    super.initState();

    _getCredentials().then((result) => setState(() {}));
  }

  Future<void> _getCredentials() async {
    _username = await _loginService.getUsername();
    _password = await _loginService.getPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela inicial")),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Username: $_username'),
          Text('Senha:    $_password'),
        ],
      ),
    );
  }
}
