import 'package:flutter/material.dart';
import 'package:trabalho1/change_password.dart';
import 'package:trabalho1/login_screen.dart';
import 'package:trabalho1/initial_screen.dart';

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
        ChangePasswordScreen.routeName: (context) => ChangePasswordScreen()
      },
    );
  }
}
