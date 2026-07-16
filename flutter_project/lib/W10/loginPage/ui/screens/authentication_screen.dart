
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onLogin});


// https://stackoverflow.com/questions/78132978/trying-to-create-a-callback-function-from-one-widget-to-another-in-flutter-it-w
  final Future<void> Function({required String email, required String password}) onLogin;
  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required!';
    }

    // https://stackoverflow.com/questions/16800540/how-should-i-check-if-the-input-is-an-email-address-in-flutter
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return 'Enter a valid email!';
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required!';
    }

    if (password.length < 6) {
      return '6 character minimum';
    }
    return null;
  }

  String? emailError;
  String? passwordError;

  void ontapLogin() async {
    setState(() {
      emailError = validateEmail(_emailController.text);
      passwordError = validatePassword(_passwordController.text);
    });
    if (emailError == null && passwordError == null) {
      await widget.onLogin(
        email: _emailController.text, password: _passwordController.text
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset('assets/login/undraw_Modern_design_re_dlp8.png', height: 400,),

            Text('Login', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                errorText: emailError,
              ),
            ),

            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                errorText: passwordError,
              ),
            ),
            SizedBox(height: 16),

            ElevatedButton(onPressed: ontapLogin, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
