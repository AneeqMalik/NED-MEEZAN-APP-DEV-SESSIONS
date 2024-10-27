import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;

  const CustomTextField(
      {super.key,
      this.isPassword = false,
      required this.controller,
      required this.prefixIcon,
      required this.label});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
