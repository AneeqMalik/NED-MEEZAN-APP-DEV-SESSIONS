import 'package:flutter/material.dart';
import 'package:login_flutter/services/auth_service.dart';
import 'package:login_flutter/widgets/text_field.dart';

class SignUpScrren extends StatefulWidget {
  const SignUpScrren({super.key});

  @override
  State<SignUpScrren> createState() => _SignUpScrrenState();
}

class _SignUpScrrenState extends State<SignUpScrren> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _signUpWithEmailAndPassword() async {
    try {
      AuthService authService = AuthService();
      await authService.signUpWithEmailAndPassword(
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
                'Register Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                label: "Email",
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _passwordController,
                label: "Password",
                isPassword: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _signUpWithEmailAndPassword();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              // Add a button to navigate to the login screen
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Already have an account? Login',
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
