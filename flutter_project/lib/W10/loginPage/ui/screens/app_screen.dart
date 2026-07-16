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
    
    if (AuthServices.instance.isLoggedIn()) {
      setState(() {
        authStatus = AuthStatus.authenticated;
      });
    }
  }

  Future<void> logout() async {
    await AuthServices.instance.logout();
    setState(() {
      // AuthServices.instance.session = null;
      authStatus = AuthStatus.unauthenticated;
      AuthServices.instance.destroySession();
    });
  }

  Future<void> checkSession () async {
    await AuthServices.instance.restoreSesssion();
    setState(() {
      if (AuthServices.instance.isLoggedIn()) {
        authStatus = AuthStatus.authenticated;
      } else {
        authStatus = AuthStatus.unauthenticated;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // restoreSession();

    checkSession();

    if (authStatus == AuthStatus.unauthenticated) {
      return LoginScreen(onLogin: onLogin);
    }

    return ScoreScreen(logout: logout);
  }
}
