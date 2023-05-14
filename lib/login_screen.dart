import 'package:flutter/material.dart';
import './initial_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = './login';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    RegExp upperCaseValidation = RegExp(r'^(?=.*?[A-Z])');
    if (value!.isNotEmpty) {
      if (upperCaseValidation.hasMatch(value)) {
        return null;
      } else {
        return "A senha deve possuir uma letra maiúscula.";
      }
    }

    return "Preenchar uma senha!";
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
                (value!.isEmpty) ? 'Please enter your username' : null,
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
            child: const Text('Submit'),
          ),
        ],
      ),
    ));
  }
}
