import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    super.key,
    required this.controller, // ✅ مطلوب
    this.hintText = "Password",
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return _PasswordFieldBody(
      controller: controller,
      hintText: hintText,
    );
  }
}

class _PasswordFieldBody extends StatefulWidget {
  const _PasswordFieldBody({
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  State<_PasswordFieldBody> createState() => _PasswordFieldBodyState();
}

class _PasswordFieldBodyState extends State<_PasswordFieldBody> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _obscureText = true;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void validate() {
    setState(() {
      _errorText = widget.controller.text.trim().isEmpty
          ? 'Please enter your password'
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          focusNode: _focusNode,
          controller: widget.controller,
          obscureText: _obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
              return 'Password must contain at least one uppercase letter';
            } else if (!RegExp(r'[a-z]').hasMatch(value)) {
              return 'Password must contain at least one lowercase letter';
            } else if (!RegExp(r'[0-9]').hasMatch(value)) {
              return 'Password must contain at least one number';
            } else if (!RegExp(r'[!@#\$&*~%^]').hasMatch(value)) {
              return 'Password must contain at least one special character';
            }
            return null;
          },
          onChanged: (_) {
            if (_errorText != null) validate();
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.lock),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[700],
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
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
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 5),
            child: Text(
              _errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
