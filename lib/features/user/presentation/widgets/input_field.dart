import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    required emailController,
    required this.labelText,
    required this.errorText,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final String labelText;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
