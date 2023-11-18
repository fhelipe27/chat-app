import 'package:chatapp/pages/home_page.dart';
import 'package:chatapp/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // se o usuario está logado
              if (snapshot.hasData) {
                return const HomePage();
              }
              // se o usuário NÃO está logado
              else {
                return const LoginOrRegister();
              }
            },
            ),
            );
  }
}
