import 'package:flutter/material.dart';
import 'package:foodgo/features/homeView/OrderHistory.dart';
import 'package:foodgo/test.dart';

class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  bool Enabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffEF2A39), Color(0xffFF2A9D)],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  margin: EdgeInsets.only(top: 30, bottom: 5),
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage:
                              AssetImage("assets/images/mosab.png"),
                        ),
                      ),
                      Positioned(
                        right: -130,
                        bottom: -20,
                        child: Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            "assets/images/burger2.png",
                            width: 350,
                            height: 140,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -140,
                        child: Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            "assets/images/burger3.png",
                            width: 350,
                            height: 140,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              enabled: Enabled,
                              initialValue: "Mosab Mohamed Sayed",
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.grey),
                                labelText: "Name",
                                labelStyle: TextStyle(color: Colors.grey[600]),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              enabled: Enabled,
                              initialValue: "mosabthezaafan@gmail.com",
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.grey),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.grey[600]),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              enabled: Enabled,
                              initialValue: "Helwan, Cairo",
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.location_on, color: Colors.grey),
                                labelText: "Delivery address",
                                labelStyle: TextStyle(color: Colors.grey[600]),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              enabled: Enabled,
                              initialValue: "*******",
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password_outlined,
                                    color: Colors.grey),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.grey[600]),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 20,
                        endIndent: 50,
                        indent: 50,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountsListView()));
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text('Payment Details'),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_rounded, size: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderHistory(),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text('Order History'),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_rounded, size: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Enabled = !Enabled;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.brown,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(Icons.edit_note_sharp,
                                    color: Colors.white, size: 25),
                              ],
                            ),
                          ),
                          Spacer(flex: 3),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderHistory(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              side: BorderSide(
                                  color: Color(0xFFEF2A39), width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Order History",
                                  style: TextStyle(
                                    color: Color(0xFFEF2A39),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(Icons.logout,
                                    color: Color(0xFFEF2A39), size: 25),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required IconData icon,
    required String value,
  }) {
    return TextFormField(
      enabled: Enabled,
      initialValue: value,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.black),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
