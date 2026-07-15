import 'package:flutter/material.dart';
import 'package:flutter_project/W10/loginPage/data/services/auth_services.dart';
import 'package:flutter_project/W10/loginPage/ui/screens/authentication_screen.dart';
import 'package:flutter_project/W10/loginPage/ui/screens/score_screen.dart';

enum AuthStatus { authenticated, unauthenticated }

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  AuthStatus authStatus = AuthStatus.unauthenticated;

  Future<void> onLogin({
    required String email,
    required String password,
  }) async {
    await AuthServices.instance.login(email: email, password: password);
    setState(() {
      authStatus = AuthStatus.authenticated;
    });
  }

  void logout() {
    AuthServices.instance.logout();
    setState(() {
      authStatus = AuthStatus.unauthenticated;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return LoginScreen();
    if (authStatus == AuthStatus.unauthenticated) {
      return LoginScreen(onLogin: onLogin);
    } 
    return ScoreScreen();
    
  }
}
