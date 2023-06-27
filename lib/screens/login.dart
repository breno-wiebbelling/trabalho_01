import 'package:flutter/material.dart';
import '../user/user_service.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = './login';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final UserService _userService = UserService();

  LoginScreen({super.key});

  Future<void> _onSubmit(BuildContext context) async {

    

    if( _formKey.currentState!.validate() ){
        await _userService
        .login(_usernameController.text, _passwordController.text)
        
        .catchError((e){
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
          
          return false;
        });
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
                  style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold, ),
                ),
                
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration( labelText: 'Username', border: OutlineInputBorder() ),
                  validator: (value) => (value!.isEmpty) ? 'Adicione um usuário!' : null,
                ),
                
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration( labelText: 'Password', border: OutlineInputBorder() ),
                  validator: (value) => (value!.isEmpty) ? 'Adicione uma senha!' : null,
                ),
                
                const SizedBox(height: 16),
                ElevatedButton( onPressed: () => _onSubmit(context), child: const Text('Enviar'), ),
                
              ],
            )),
      ),
    );
  }
}
