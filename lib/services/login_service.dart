// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trabalho_1/screens/initial.dart';
import 'package:trabalho_1/screens/login.dart';

class LoginService {
  final RegExp _upperCaseRegex = RegExp(r'^(?=.*?[A-Z])');
  final RegExp _lowerCaseRegex = RegExp(r'^(?=.*?[a-z])');
  final RegExp _specialCharRegex = RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' "'" ']');
  final RegExp _numberRegex = RegExp(r'^(?=.*?[0-9])');
  final RegExp _lengthRegex = RegExp(r'^.{8,16}');

  final String _USERNAME_KEY = "username";
  final String _PASSWORD_KEY = "password";

  SharedPreferences? _prefs;

  Future<void> _initiatePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) return "Adicione uma senha!";

    if (!_upperCaseRegex.hasMatch(password)) return "A senha deve possuir uma letra maiuscula.";
    if (!_lowerCaseRegex.hasMatch(password)) return "A senha deve possuir uma letra minuscula.";
    if (!_numberRegex.hasMatch(password)) "A senha deve possuir um numero.";
    if (!password.contains(_specialCharRegex)) return "A senha deve possuir um caracter especial.";
    
    if (!_lengthRegex.hasMatch(password)) return 'Sua senha possui ${password.length} caracteres. \nPorém deve ter entre 8 e 16 caracteres.';

    return null;
  }

  Future<void> setPassword(String oldPass, String newPass, BuildContext context) async {
    await _initiatePrefs();

    if (oldPass == await getPassword()) {
      _prefs!.setString(_PASSWORD_KEY, newPass);
      if(context.mounted) Navigator.pushReplacementNamed(context, InitialScreen.routeName);
    }
  }

  Future<void> saveCredentials(
      String username, String password, BuildContext context) async {
    await _initiatePrefs();

    await _prefs!.setString(_USERNAME_KEY, username);
    await _prefs!.setString(_PASSWORD_KEY, password);

    if(context.mounted) Navigator.pushReplacementNamed(context, InitialScreen.routeName);
  }

  Future<String?> getUsername() async {
    await _initiatePrefs();
    return _prefs!.getString(_USERNAME_KEY);
  }

  Future<String?> getPassword() async {
    await _initiatePrefs();
    return _prefs!.getString(_PASSWORD_KEY);
  }

  Future<void> logout(BuildContext context) async {
    await _initiatePrefs();
    await _prefs!.clear();

    if(context.mounted) Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
