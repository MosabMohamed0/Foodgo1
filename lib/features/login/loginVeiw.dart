import 'package:flutter/material.dart';
import 'package:foodgo/features/homeView/TabControlle.dart';
import 'package:foodgo/features/login/forgetPassword.dart';
import 'package:foodgo/models/account.dart';
import 'package:hive/hive.dart';
import 'creatAccount.dart';
import 'package:collection/collection.dart';

class LoginVeiw extends StatefulWidget {
  const LoginVeiw({super.key});

  @override
  State<LoginVeiw> createState() => _LoginVeiwState();
}

class _LoginVeiwState extends State<LoginVeiw> {
  final _formKey = GlobalKey<FormState>();

  bool visibilityPassword = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final box = Hive.box<Account>('accounts');
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      final user = box.values.firstWhereOrNull(
        (acc) => acc.email == email && acc.password == password,
      );

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => TabControlle()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      Text(
                        'Foodgo',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Lobster',
                        ),
                      ),
                      SizedBox(height: 43),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6A0F0F),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFF939B),
                          Color(0xFFEF2A39),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 40),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Enter email address',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _emailController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Enter email address",
                                    hintStyle: const TextStyle(fontSize: 15),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusColor: Colors.black,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email is required";
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return "Enter a valid email";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Enter password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: !visibilityPassword,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter password",
                                    hintStyle: const TextStyle(fontSize: 15),
                                    prefixIcon: const Icon(
                                      Icons.password_outlined,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        visibilityPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          visibilityPassword =
                                              !visibilityPassword;
                                        });
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password is required";
                                    }
                                    if (value.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return ForgetPassword();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Forget your password ? ',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 60),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: _submitForm,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      backgroundColor: const Color(0xFFEF2A39),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 100),
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("You don't have account ?"),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return CreateAccount();
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
