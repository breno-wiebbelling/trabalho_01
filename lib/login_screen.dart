import 'package:flutter/material.dart';
import './initial_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = './login';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegExp upperCaseValidation = RegExp(r'^(?=.*?[A-Z])');
  final RegExp lowerCaseValidation = RegExp(r'^(?=.*?[a-z])');
  final RegExp specialCharValidation = RegExp(r'^[\W_]*$');
  final RegExp numberValidation = RegExp(r'^(?=.*?[0-9])');
  final RegExp lengthValidation = RegExp(r'^.{8,16}');

  LoginScreen({super.key});

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
  }

  void _onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await _saveCredentials();
      Navigator.pushReplacementNamed(context, InitialScreen.routeName);
    }
  }

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) return "Adicione uma senha!";

    if (!upperCaseValidation.hasMatch(value)) {
      return "A senha deve possuir uma letra maiuscula.";
    }
    if (!lowerCaseValidation.hasMatch(value)) {
      return "A senha deve possuir uma letra minuscula.";
    }

    // if (!specialCharValidation.hasMatch(value)) {
    //   return "A senha deve possuir uma caractere especial.";
    // }

    if (!lengthValidation.hasMatch(value)) {
      return 'Sua senha possui ${value.length} caracteres. \nPorém deve ter entre 8 e 16 caracteres.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              validator: (value) => _passwordValidator(value),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _onSubmit(context),
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
