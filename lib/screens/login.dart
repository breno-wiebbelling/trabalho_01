import 'package:flutter/material.dart';
import '../services/login_service.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = './login';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginService _loginService = LoginService();

  LoginScreen({super.key});

  Future<void> _onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await _loginService.saveCredentials(
          _usernameController.text, _passwordController.text, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      (value!.isEmpty) ? 'Adicione um usuário!' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _loginService.validatePassword(value),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _onSubmit(context),
                  child: const Text('Enviar'),
                ),
              ],
            )),
      ),
    );
  }
}
