import 'package:flutter/material.dart';
import 'package:foodgo/models/account.dart';
import 'package:hive/hive.dart';
import 'loginVeiw.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  List<Account> myList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final box = Hive.box<Account>('accounts');
    setState(() {
      myList = box.values.toList().cast<Account>();
      // print(myList);
    });
  }

  void _onContinuePressed() {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim().toLowerCase();
    final username = _usernameController.text.trim().toLowerCase();

    final matches = myList.where((acc) {
      final accEmail = acc.email.trim().toLowerCase();
      final accUser = acc.username.trim().toLowerCase();
      return accEmail == email && accUser == username;
    }).toList();

    if (matches.isNotEmpty) {
      final found = matches.first;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your password is: ${found.password}'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(milliseconds: 2100), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginVeiw()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No account found with this email and username'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios)),
                        ],
                      ),
                      Text('Foodgo',
                          style:
                              TextStyle(fontSize: 60, fontFamily: 'Lobster')),
                      SizedBox(height: 43),
                      Text('Forget password',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6A0F0F),
                          )),
                      SizedBox(height: 43),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFF939B), Color(0xFFEF2A39)],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          width: MediaQuery.sizeOf(context).width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Enter email address',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: _emailController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter email address",
                                    prefixIcon:
                                        Icon(Icons.email, color: Colors.grey),
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
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return 'Enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                Text('Enter user name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: _usernameController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter user name",
                                    prefixIcon:
                                        Icon(Icons.person, color: Colors.grey),
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
                                      return 'Please enter your username';
                                    }
                                    if (value.length < 3) {
                                      return 'Username must be at least 3 characters';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 43),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: _onContinuePressed,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      backgroundColor: Color(0xFFEF2A39),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 100),
                                    ),
                                    child: Text("Continue",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
