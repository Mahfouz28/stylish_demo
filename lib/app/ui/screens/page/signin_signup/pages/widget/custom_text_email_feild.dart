import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.hintText = "Username or Email",
    this.errorText,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final String? errorText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
            ).hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/user.png",
                height: 30,
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFF83758),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
