import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:collection/collection.dart';
import 'package:foodgo/models/account.dart';

import 'loginVeiw.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  bool visibilityPassword1 = true;
  bool visibilityPassword2 = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final username = _usernameController.text.trim();

    if (password != confirmPassword) {
      _showMessage('Passwords do not match');
      return;
    }

    final box = Hive.box<Account>('accounts');

    final existing = box.values.firstWhereOrNull((acc) => acc.email == email);
    if (existing != null) {
      _showMessage('Email already exists');
      return;
    }

    await box.add(Account(
      username: username,
      email: email,
      password: password,
    ));

    _showMessage('Account created successfully!');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginVeiw()),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text('Foodgo',
                    style: TextStyle(fontSize: 60, fontFamily: 'Lobster')),
                const SizedBox(height: 20),
                const Text('Create account',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6A0F0F))),
                const SizedBox(height: 30),

                // Email
                _buildTextField(
                  'Enter email address',
                  Icons.email,
                  _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),

                // Password
                _buildPasswordField(
                  'Enter password',
                  _passwordController,
                  visibilityPassword1,
                  () {
                    setState(() => visibilityPassword1 = !visibilityPassword1);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                // Confirm password
                _buildPasswordField(
                  'Confirm password',
                  _confirmPasswordController,
                  visibilityPassword2,
                  () {
                    setState(() => visibilityPassword2 = !visibilityPassword2);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password is required';
                    }
                    return null;
                  },
                ),

                // Username
                _buildTextField(
                  'Enter username',
                  Icons.person,
                  _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color(0xFFEF2A39),
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                  ),
                  child: const Text("Sign Up",
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginVeiw()),
                        );
                      },
                      child: const Text("Log In",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, TextEditingController controller,
      {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller,
      bool isObscured, VoidCallback toggleVisibility,
      {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isObscured,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey),
            onPressed: toggleVisibility,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
