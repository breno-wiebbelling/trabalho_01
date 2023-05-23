import 'package:flutter/material.dart';
import 'package:trabalho1/screens/initial.dart';
import 'package:trabalho1/services/login_service.dart';
import 'package:trabalho1/screens/change_password.dart';

class SideMenu extends StatelessWidget {
  SideMenu({super.key});

  final LoginService _loginService = LoginService();

  void _changeRoute(BuildContext context, String routeName) {
    Navigator.of(context).popAndPushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Breno Wiebbelling'),
            accountEmail: const Text('brenoassis@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/user.jpg',
                  width: 90,
                  height: 90,
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Inicial'),
            leading: const Icon(Icons.home),
            onTap: () => _changeRoute(context, InitialScreen.routeName),
          ),
          ListTile(
            title: const Text('Mudar senha'),
            leading: const Icon(Icons.person),
            onTap: () => _changeRoute(context, ChangePasswordScreen.routeName),
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
