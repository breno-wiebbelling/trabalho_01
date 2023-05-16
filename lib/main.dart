import 'package:flutter/material.dart';
import 'package:trabalho_1/screens/change_password.dart';
import 'package:trabalho_1/screens/login.dart';
import 'package:trabalho_1/screens/initial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDM 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        InitialScreen.routeName: (context) => const InitialScreen(),
        ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen()
      },
    );
  }
}
