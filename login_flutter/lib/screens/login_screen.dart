import 'package:flutter/material.dart';
import 'package:login_flutter/services/auth_service.dart';
import 'package:login_flutter/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _loginWithEmailAndPassword() async {
    try {
      AuthService authService = AuthService();
      await authService.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(controller: _emailController, prefixIcon: Icons.email, label: "Email"),
              const SizedBox(height: 20),
              CustomTextField(controller: _passwordController, prefixIcon: Icons.lock, label: "Password", isPassword: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _loginWithEmailAndPassword();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Create an account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}