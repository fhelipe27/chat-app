import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_text_field.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // loga o usuario
  void signIn() async {
    // pega o serviço de auth
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
      ),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),

                    // logo
                    Icon(
                      Icons.message,
                      size: 100,
                      color: Colors.grey[800],
                    ),

                    const SizedBox(height: 50),

                    // bem vindo de volta mensagem
                    const Text(
                      "Bem vindo de volta, sentimos sua falta!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // email textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    // senha textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Senha',
                      obscureText: true,
                    ),

                    const SizedBox(height: 25),

                    // botao de entrar
                    MyButton(onTap: signIn, text: "Entrar"),

                    const SizedBox(height: 50),

                    // mensagem de "nao é um membro?" e texto de cadastre-se
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não é um membro?'),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Cadastre-se',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
