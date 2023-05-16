import 'package:flutter/material.dart';
import 'package:trabalho_1/services/login_service.dart';
import 'package:trabalho_1/screens/change_password.dart';

class SideMenu extends StatelessWidget {
  SideMenu({super.key});

  final LoginService _loginService = LoginService();

  void _changePass(BuildContext context) {
    Navigator.of(context).popAndPushNamed(ChangePasswordScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Oflutter.com'),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/user.png',
                  width: 90,
                  height: 90,
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Credenciais'),
            leading: const Icon(Icons.person),
            onTap: () => _changePass(context),
          ),
          const Divider(),
          ListTile(
            title: const Text('Sair'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => _loginService.logout(context),
          ),
        ],
      ),
    );
  }
}
