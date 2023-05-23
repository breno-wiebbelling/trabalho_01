import 'package:flutter/material.dart';
import 'package:trabalho1/drawers/side_menu.dart';
import 'package:trabalho1/services/login_service.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = './cp';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _originalPass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _newPassConf = TextEditingController();

  String? _prevPass;

  final LoginService _loginService = LoginService();

  void _onSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await _loginService.setPassword(
          _originalPass.text, _newPass.text, context);
    }
  }

  @override
  initState() {
    super.initState();

    _loginService
        .getPassword()
        .then((result) => _prevPass = result)
        .whenComplete(() => setState(() {}));
  }

  String? _isPasswordEqualsAsBefore(BuildContext context, String? newPass) {
    return (newPass != _prevPass) ? "Senha incorreta" : null;
  }

  String? _newPassValidator() {
    return ((_newPass.text != _newPassConf.text)
        ? "As senhas novas devem ser iguais"
        : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Mudança de senha")),
        drawer: SideMenu(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _originalPass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha atual',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      _isPasswordEqualsAsBefore(context, value),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _newPass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Nova senha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _loginService.validatePassword(value),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _newPassConf,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Repita a nova senha',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _newPassValidator(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _onSubmit(context),
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ));
  }
}
