import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool validate;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validate = false,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !isPasswordVisible,
      obscuringCharacter: "*",
      validator: widget.validate
          ? (value) {
              if (value == null || value.isEmpty) {
                return '${widget.label} is required';
              }
              return null;
            }
          : null,
      style: TextStyle(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off))
              : null),
    );
  }
}
